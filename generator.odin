package main;

import "core:fmt";
import "core:reflect";
import "core:encoding/json";
import "core:strings";
import "core:os";
import "core:unicode/utf8";

main :: proc() {
    fmt.println("Generator for odin-imgui v0.1 by ThisDrunkDane (Mikkel Hjortshoej)");

   {
        data, _ := os.read_entire_file("test.json");
        value, err := json.parse(data);

        if err == json.Error.None {
            fmt.println("JSON parsed successfully!");
            obj := value.value.(json.Object);

            enums := obj["enums"].value.(json.Object);
            //print_enums(enums);

            structs := obj["structs"].value.(json.Object);
            //print_structs(structs);

        } else {
            fmt.eprintln("Error in json!", err);
        }
   }
   {
        data, _ := os.read_entire_file("test2.json");
        value, err := json.parse(data);

        if err == json.Error.None {
            fmt.println("JSON parsed successfully!");
            obj := value.value.(json.Object);

            print_procedures(obj);

        } else {
            fmt.eprintln("Error in json!", err);
        }
   }
}

print_procedures :: proc(obj : json.Object) {
    Foreign_Group :: struct {
        name : string,
        procs : [dynamic]Foreign_Proc,
        longest_link_name : int,
        longest_proc_name : int,
    };

    Foreign_Proc :: struct {
        link_name : string,
        name      : string,
        args      : [dynamic]string,
        ret_type  : string,
        var_args  : bool,
    };

    groups : map[string]^Foreign_Group;

    count_overloads :: proc(overloads: json.Array) -> int {
        res := 0;
        for x in overloads {
            overload := x.value.(json.Object);
            if _, has_nonUDT := overload["nonUDT"]; has_nonUDT == false {
                res += 1;
            }
        }
        return res;
    }

    figure_out_default_val :: proc(b : ^strings.Builder, c_name : string, overload : json.Object) -> (found: bool, inferred : bool) {
        inferred = false;
        found = false;

        obj, has_defaults := overload["defaults"].value.(json.Object);
        if has_defaults == false do return;

        default_v, name_has_default := obj[c_name];
        if name_has_default == false do return; 

        found = true;
        
        c_val := default_v.value.(json.String);
        val := "ERROR";
        
        if pre, has_predefind := predefined_defaults_by_value[c_val]; has_predefind {
            val = pre;
        } else if c_val == "FLT_MAX" {
            val = "max(f32)";
            inferred = true;
        } else if c_val == "sizeof(float)" {
            val = "i32(size_of(f32))";
            inferred = true;
        } else if c_val == "((void*)0)" {
            val = "nil";
        } else {
            val = clean_imgui_namespacing(c_val);
        
            if utf8.rune_at_pos(val, 0) != '(' {
                replaced_left, replaced_right : bool;
                val, replaced_left = strings.replace_all(val, "(", "{");
                val, replaced_right = strings.replace_all(val, ")", "}");
                inferred = replaced_left || replaced_right;
            }

            if strings.has_suffix(val, "f") do val = strings.trim_right(val, "f");
        }
        
        strings.write_string(b, val);
        return;
    }

    should_skip :: proc(overload : json.Object) -> bool {
        if _, has_nonUDT := overload["nonUDT"]; has_nonUDT do return true;

        stname_v, has_stname := overload["stname"]; 
        if has_stname {
            stname := stname_v.value.(json.String);
            if stname == "ImVector" do return true;
        }

        return false;
    }

    set_ctor_name :: proc(first_arg : ^json.Object) -> string {
        if first_arg != nil {
            c_type := first_arg["type"].value.(json.String);
            b2 := strings.make_builder();
            convert_type(&b2, "", c_type, 0);
            str := strings.to_string(b2);
            if strings.has_prefix(str, "^") do str = str[1:];
            return fmt.tprintf("%s_ctor", str);
        } else {
            return "ctor";
        }
    }

    set_proc_name :: proc(res : ^Foreign_Proc, 
                                  overload : json.Object, 
                                  overload_count : int, 
                                  first_arg : ^json.Object) {
        if pre, has_predefind := proc_name_by_link_name[res.link_name]; has_predefind {
            res.name = pre;
            return;
        }


        proc_name, has_funcname := overload["funcname"].value.(json.String);
        if has_funcname == false || overload_count > 1 {
            proc_name = res.link_name;
        }
        
        if first_arg != nil {
            c_name := first_arg["name"].value.(json.String);
            if c_name == "label" {
                res.name = res.link_name;
                return;
            }
        }

        if res.var_args == true {
            res.name = res.link_name;
            return;
        }

        b := strings.make_builder();
        proc_name = clean_imgui_namespacing(proc_name);

        if stname_v, has_stname := overload["stname"]; has_stname {
            stname := stname_v.value.(json.String);
            if(len(stname) > 0) {
                type_name := clean_imgui_namespacing(stname);
                strings.write_string(&b, type_name);
                strings.write_rune(&b, '_');
            }
        }

        if _, is_ctor := overload["constructor"]; is_ctor {
            proc_name = set_ctor_name(first_arg);
        }

        if _, is_ctor := overload["destructor"]; is_ctor do proc_name = "destroy";
        
        strings.write_string(&b, proc_name);
        res.name = strings.to_string(b);
    }

    get_link_name :: proc(overload : json.Object) -> string {
        link_name := overload["cimguiname"].value.(json.String);
        if v, ok := overload["ov_cimguiname"]; ok {
            link_name = v.value.(json.String);
        }
        return link_name;
    }

    for def_key, def_val in obj {
        overloads := def_val.value.(json.Array);
        overload_count := count_overloads(overloads);

        overloads_label: for x in overloads {
            res := Foreign_Proc{};
            overload := x.value.(json.Object);

            if should_skip(overload) do continue;

            res.link_name = strings.clone(get_link_name(overload));

            args_arr := overload["argsT"].value.(json.Array);
            for y in args_arr {
                field := y.value.(json.Object);
                
                c_type := field["type"].value.(json.String);
                if c_type == "va_list" do continue overloads_label;
                
                c_name := field["name"].value.(json.String);
                if c_name == "..." {
                    res.var_args = true;
                    append(&res.args, "#c_varargs args : ..any");
                    continue;
                }

                size, has_size := field["size"];
                arg_name := clean_array_brackets(c_name, has_size);
                if arg_name == "in" do arg_name = "in_";

                b_type := strings.make_builder();
                b_default := strings.make_builder();
                convert_type(&b_type, arg_name, c_type, 0);
                inferred, default_found := figure_out_default_val(&b_default, c_name, overload);

                if default_found == false {
                    append(&res.args, fmt.aprintf("%s : %s", arg_name, strings.to_string(b_type)));
                } else if inferred == true {
                    append(&res.args, fmt.aprintf("%s := %s", arg_name, strings.to_string(b_default)));
                } else {
                    append(&res.args, fmt.aprintf("%s : %s = %s", 
                                                  arg_name, strings.to_string(b_type), strings.to_string(b_default)));
                }
            }

            set_proc_name(&res, 
                          overload, 
                          overload_count, 
                          len(args_arr) > 0 ? &args_arr[0].value.(json.Object) : nil);

            ret, has_ret := overload["ret"].value.(json.String);
            if has_ret == true && ret != "void" {
                b := strings.make_builder();
                convert_type(&b, "", ret, 0);
                res.ret_type = strings.to_string(b);
            }

            group_name := clean_imgui_namespacing(overload["stname"].value.(json.String));
            if group, ok := groups[group_name]; ok {
                append(&group.procs, res);                
                group.longest_link_name = max(group.longest_link_name, len(res.link_name));
                group.longest_proc_name = max(group.longest_proc_name, len(res.name));
            } else {
                group := new(Foreign_Group);
                group.name = group_name;
                group.longest_link_name = min(int);
                group.longest_proc_name = min(int);

                append(&group.procs, res);
                
                groups[group_name] = group;
            }
        }
    }

    print_proc :: proc(p : Foreign_Proc, longest_link_name : int, longest_proc_name : int) {
        fmt.printf("\t@(link_name = \"%s\") ", p.link_name);
        right_pad(p.link_name, longest_link_name);
        fmt.printf("%s ", p.name);
        right_pad(p.name, longest_proc_name);

        fmt.printf(":: proc(");
        for a, i in p.args{
            fmt.printf("%s", a);
            if i < len(p.args)-1 {
                fmt.printf(", ");
            }
        }

        fmt.printf(") ");
        if len(p.ret_type) > 0 {
            fmt.printf("-> %s ", p.ret_type);
        }
        fmt.println("---;");
    }

    for k, v in groups {
        fmt.println("@(default_calling_convention=\"c\")");
        fmt.println("foreign cimgui {");
        for p in v.procs {
            if strings.has_prefix(p.name, "ig") == true do continue;
            print_proc(p, v.longest_link_name, v.longest_proc_name);
        }

        

        header_printed := false;
        for p in v.procs {
            if strings.has_prefix(p.name, "ig") == false do continue;

            if header_printed == false {
                fmt.println("");
                fmt.println("////////////////////////////");
                fmt.println("/// NEEDS OVERLOADING!!!");
                fmt.println("");
                header_printed = true;
            }

            print_proc(p, v.longest_link_name, v.longest_proc_name);
        }
        fmt.println("}\n");
    }
}

right_pad :: proc(text : string, max_length : int) {
    if len(text) <= max_length {
        for _ in len(text)..max_length-1 {
            fmt.printf(" ");
        }
    }
}

convert_type :: proc(b : ^strings.Builder, field_name : string, c_type : string, size : i64) {
    type := "ERROR!";
    skip_ptr := false;

    switch c_type {
        case "void*", "const void*" : {
            type = "rawptr";
            skip_ptr = true;
        }
        case "const char*" : {
            type = "cstring";
            skip_ptr = true;
        }
        case: {
            if pre, ok := predefined_type_by_name[field_name]; ok {
                type = pre;
                break;
            }
            

            if pre, ok := predefined_type_by_type[c_type]; ok {
                type = pre;
                break;
            }

            type = clean_imgui_namespacing(clean_const_ref_ptr(c_type));
        }
    }

    if size > 0 do strings.write_string(b, fmt.tprintf("[%d]", size));
    if skip_ptr == false {
        if strings.has_suffix(c_type, "*") {
            for _ in 0..strings.count(c_type, "*")-1 {
                strings.write_rune(b, '^');
            }
        }
        
        if strings.has_suffix(c_type, "&") {
            strings.write_rune(b, '^');
        }
    }

    strings.write_string(b, type);
}

print_structs :: proc(structs : json.Object) {

    Struct_Definiton :: struct {
        name : string,
        fields : [dynamic]Struct_Field,
        longest_field_len : int,
    };

    Struct_Field :: struct {
        name : string,
        type : string,
    };

    definitions : [dynamic]Struct_Definiton;

    get_arg_size :: proc(arg : json.Object) -> i64 {
        v, ok := arg["size"];
        return ok ? v.value.(json.Integer) : 0;
    }

    get_arg_name :: proc(arg : json.Object, has_size : bool) -> string {
        return clean_array_brackets(arg["name"].value.(json.String), has_size);
    }

    get_arg_type :: proc(b : ^strings.Builder, arg_name : string, arg : json.Object, size : i64) {
        c_type := arg["type"].value.(json.String);
        convert_type(b, arg_name, c_type, size);
    }

    for k, v in structs {
        _, is_predefined := structs_predefined[k];
        if is_predefined == true do continue;

        def := Struct_Definiton{};
        def.name = clean_imgui_namespacing(k[:len(k)]);

        for x in v.value.(json.Array) {
            b := strings.make_builder();
            arg := x.value.(json.Object);

            size := get_arg_size(arg);
            arg_name := get_arg_name(arg, size > 0);
            get_arg_type(&b, arg_name, arg, size);
            
            append(&def.fields, Struct_Field{ strings.clone(arg_name), strings.to_string(b) });
        }

        def.longest_field_len = min(int);
        for x in def.fields {
            def.longest_field_len = max(def.longest_field_len, len(x.name));
        }

        append(&definitions, def);
    }

    for def in definitions {
        fmt.printf("%s :: struct {\n", def.name);

        for f in def.fields {
            fmt.printf("\t%s", f.name);
            right_pad(f.name, def.longest_field_len);
            fmt.printf(" : %s,\n", f.type);
        }

        fmt.println("};\n");
    }
}

clean_array_brackets :: proc(s : string, has_size : bool) -> string {
    if has_size == false do return s;

    result := s;
    i := strings.index(s, "[");
    if i > 0 {
        result = result[:i];
    }

    return result;
}

clean_const_ref_ptr :: proc(s : string) -> string {
    result := s;
    if strings.has_prefix(s, "const") {
        result = result[6:];
    }

    i := strings.index(result, "*");
    if i > 0 {
        result = result[:i];
    }

    if strings.has_suffix(s, "&") {
        result = result[:len(result)-1];
    }

    return result;
}

print_enums :: proc(enums : json.Object) {
    Enum_Defintion :: struct {
        name : string,
        fields : [dynamic]Enum_Field,
        longest_field_len : int,
    };
    
    Enum_Field :: struct {
        name  : string,
        value : string,
    };

    definitions : [dynamic]Enum_Defintion;

    for k, v in enums {
        def := Enum_Defintion{};
        arr := v.value.(json.Array);

        def.name = clean_imgui_namespacing(k[:len(k)-1]);

        clean_field_val :: proc(name : string) -> string {
            cleaned := strings.trim_space(name);
            cleaned = clean_imgui_namespacing(cleaned);
            parts := strings.split(cleaned, "_");
            return len(parts) > 1 ? parts[1] : cleaned;
        }

        get_field_name :: proc(field : json.Object) -> string {
            parts := strings.split(field["name"].value.(json.String), "_");
            part := len(parts[1]) != 0 ? parts[1] : parts[2];
            return part;
        }

        for x in arr {
            res := Enum_Field{};
            field := x.value.(json.Object);
            res.name = strings.clone(get_field_name(field));

            #partial switch v in field["value"].value {
                case json.Integer: {
                    res.value = fmt.aprintf("%d", v);
                }

                case json.String: {
                    c_value := field["value"].value.(json.String);

                    if strings.index_any(c_value, "|") > 0 {
                        parts := strings.split(c_value, "|");
                        b := strings.make_builder();
                        for x, i in parts {
                            strings.write_string(&b, clean_field_val(x));
                            if i < len(parts)-1 {
                                strings.write_string(&b, " | ");
                            }
                        }
                        res.value = strings.to_string(b);
                    } else {
                        res.value = strings.clone(clean_field_val(c_value));
                    }
                }
            }
           
            append(&def.fields, res);
        }

        def.longest_field_len = min(int);
        for x in def.fields {
            def.longest_field_len = max(def.longest_field_len, len(x.name));
        }

        append(&definitions, def);
    }

    for def in definitions {
        fmt.printf("%s :: enum i32 {\n", def.name);
            for x in def.fields {
            fmt.printf("\t%s", x.name);
            right_pad(x.name, def.longest_field_len);
            fmt.printf(" = %s,\n", x.value);
        }

        fmt.println("}\n");
    }
}

clean_imgui_namespacing :: proc(s : string) -> string {
    if strings.has_prefix(s, "Im") == true && strings.has_prefix(s, "Image") == false {
        result := s[2:];
        if strings.has_prefix(result, "Gui") == true {
            result = result[3:];
        }
        return result;
    }

    return s;
}