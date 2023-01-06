package imgui

when ODIN_DEBUG {
	foreign import cimgui "external/cimgui_debug.lib"
} else {
	foreign import cimgui "external/cimgui.lib"
}

@(default_calling_convention="c")
foreign cimgui {
	ImColor_HSV    :: proc(pOut: ^Color, h: f32, s: f32, v: f32, a: f32) ---
	ImColor_SetHSV :: proc(self: ^Color, h: f32, s: f32, v: f32, a: f32) ---

	ImDrawData_Clear             :: proc(self: ^Draw_Data) ---
	ImDrawData_DeIndexAllBuffers :: proc(self: ^Draw_Data) ---
	ImDrawData_ScaleClipRects    :: proc(self: ^Draw_Data, fb_scale: Vec2) ---

	ImDrawListSplitter_Clear             :: proc(self: ^Draw_List_Splitter) ---
	ImDrawListSplitter_ClearFreeMemory   :: proc(self: ^Draw_List_Splitter) ---
	ImDrawListSplitter_Merge             :: proc(self: ^Draw_List_Splitter, draw_list: ^Draw_List) ---
	ImDrawListSplitter_SetCurrentChannel :: proc(self: ^Draw_List_Splitter, draw_list: ^Draw_List, channel_idx: i32) ---
	ImDrawListSplitter_Split             :: proc(self: ^Draw_List_Splitter, draw_list: ^Draw_List, count: i32) ---

	ImDrawList_AddBezierCubic              :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: u32, thickness: f32, num_segments: i32) ---
	ImDrawList_AddBezierQuadratic          :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, col: u32, thickness: f32, num_segments: i32) ---
	ImDrawList_AddCallback                 :: proc(self: ^Draw_List, callback: Draw_Callback, callback_data: rawptr) ---
	ImDrawList_AddCircle                   :: proc(self: ^Draw_List, center: Vec2, radius: f32, col: u32, num_segments: i32, thickness: f32) ---
	ImDrawList_AddCircleFilled             :: proc(self: ^Draw_List, center: Vec2, radius: f32, col: u32, num_segments: i32) ---
	ImDrawList_AddConvexPolyFilled         :: proc(self: ^Draw_List, points: ^Vec2, num_points: i32, col: u32) ---
	ImDrawList_AddDrawCmd                  :: proc(self: ^Draw_List) ---
	ImDrawList_AddImage                    :: proc(self: ^Draw_List, user_texture_id: Texture_ID, p_min: Vec2, p_max: Vec2, uv_min: Vec2, uv_max: Vec2, col: u32) ---
	ImDrawList_AddImageQuad                :: proc(self: ^Draw_List, user_texture_id: Texture_ID, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, uv1: Vec2, uv2: Vec2, uv3: Vec2, uv4: Vec2, col: u32) ---
	ImDrawList_AddImageRounded             :: proc(self: ^Draw_List, user_texture_id: Texture_ID, p_min: Vec2, p_max: Vec2, uv_min: Vec2, uv_max: Vec2, col: u32, rounding: f32, flags: Draw_Flags) ---
	ImDrawList_AddLine                     :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, col: u32, thickness: f32) ---
	ImDrawList_AddNgon                     :: proc(self: ^Draw_List, center: Vec2, radius: f32, col: u32, num_segments: i32, thickness: f32) ---
	ImDrawList_AddNgonFilled               :: proc(self: ^Draw_List, center: Vec2, radius: f32, col: u32, num_segments: i32) ---
	ImDrawList_AddPolyline                 :: proc(self: ^Draw_List, points: ^Vec2, num_points: i32, col: u32, flags: Draw_Flags, thickness: f32) ---
	ImDrawList_AddQuad                     :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: u32, thickness: f32) ---
	ImDrawList_AddQuadFilled               :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, p4: Vec2, col: u32) ---
	ImDrawList_AddRect                     :: proc(self: ^Draw_List, p_min: Vec2, p_max: Vec2, col: u32, rounding: f32, flags: Draw_Flags, thickness: f32) ---
	ImDrawList_AddRectFilled               :: proc(self: ^Draw_List, p_min: Vec2, p_max: Vec2, col: u32, rounding: f32, flags: Draw_Flags) ---
	ImDrawList_AddRectFilledMultiColor     :: proc(self: ^Draw_List, p_min: Vec2, p_max: Vec2, col_upr_left: u32, col_upr_right: u32, col_bot_right: u32, col_bot_left: u32) ---
	ImDrawList_AddText_Vec2                :: proc(self: ^Draw_List, pos: Vec2, col: u32, text_begin: cstring, text_end: cstring) ---
	ImDrawList_AddText_FontPtr             :: proc(self: ^Draw_List, font: ^ImFont, font_size: f32, pos: Vec2, col: u32, text_begin: cstring, text_end: cstring, wrap_width: f32, cpu_fine_clip_rect: ^Vec4) ---
	ImDrawList_AddTriangle                 :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, col: u32, thickness: f32) ---
	ImDrawList_AddTriangleFilled           :: proc(self: ^Draw_List, p1: Vec2, p2: Vec2, p3: Vec2, col: u32) ---
	ImDrawList_ChannelsMerge               :: proc(self: ^Draw_List) ---
	ImDrawList_ChannelsSetCurrent          :: proc(self: ^Draw_List, n: i32) ---
	ImDrawList_ChannelsSplit               :: proc(self: ^Draw_List, count: i32) ---
	ImDrawList_CloneOutput                 :: proc(self: ^Draw_List) -> ^Draw_List ---
	ImDrawList_GetClipRectMax              :: proc(pOut: ^Vec2, self: ^Draw_List) ---
	ImDrawList_GetClipRectMin              :: proc(pOut: ^Vec2, self: ^Draw_List) ---
	ImDrawList_PathArcTo                   :: proc(self: ^Draw_List, center: Vec2, radius: f32, a_min: f32, a_max: f32, num_segments: i32) ---
	ImDrawList_PathArcToFast               :: proc(self: ^Draw_List, center: Vec2, radius: f32, a_min_of_12: i32, a_max_of_12: i32) ---
	ImDrawList_PathBezierCubicCurveTo      :: proc(self: ^Draw_List, p2: Vec2, p3: Vec2, p4: Vec2, num_segments: i32) ---
	ImDrawList_PathBezierQuadraticCurveTo  :: proc(self: ^Draw_List, p2: Vec2, p3: Vec2, num_segments: i32) ---
	ImDrawList_PathClear                   :: proc(self: ^Draw_List) ---
	ImDrawList_PathFillConvex              :: proc(self: ^Draw_List, col: u32) ---
	ImDrawList_PathLineTo                  :: proc(self: ^Draw_List, pos: Vec2) ---
	ImDrawList_PathLineToMergeDuplicate    :: proc(self: ^Draw_List, pos: Vec2) ---
	ImDrawList_PathRect                    :: proc(self: ^Draw_List, rect_min: Vec2, rect_max: Vec2, rounding: f32, flags: Draw_Flags) ---
	ImDrawList_PathStroke                  :: proc(self: ^Draw_List, col: u32, flags: Draw_Flags, thickness: f32) ---
	ImDrawList_PopClipRect                 :: proc(self: ^Draw_List) ---
	ImDrawList_PopTextureID                :: proc(self: ^Draw_List) ---
	ImDrawList_PrimQuadUV                  :: proc(self: ^Draw_List, a: Vec2, b: Vec2, c: Vec2, d: Vec2, uv_a: Vec2, uv_b: Vec2, uv_c: Vec2, uv_d: Vec2, col: u32) ---
	ImDrawList_PrimRect                    :: proc(self: ^Draw_List, a: Vec2, b: Vec2, col: u32) ---
	ImDrawList_PrimRectUV                  :: proc(self: ^Draw_List, a: Vec2, b: Vec2, uv_a: Vec2, uv_b: Vec2, col: u32) ---
	ImDrawList_PrimReserve                 :: proc(self: ^Draw_List, idx_count: i32, vtx_count: i32) ---
	ImDrawList_PrimUnreserve               :: proc(self: ^Draw_List, idx_count: i32, vtx_count: i32) ---
	ImDrawList_PrimVtx                     :: proc(self: ^Draw_List, pos: Vec2, uv: Vec2, col: u32) ---
	ImDrawList_PrimWriteIdx                :: proc(self: ^Draw_List, idx: Draw_Idx) ---
	ImDrawList_PrimWriteVtx                :: proc(self: ^Draw_List, pos: Vec2, uv: Vec2, col: u32) ---
	ImDrawList_PushClipRect                :: proc(self: ^Draw_List, clip_rect_min: Vec2, clip_rect_max: Vec2, intersect_with_current_clip_rect: bool) ---
	ImDrawList_PushClipRectFullScreen      :: proc(self: ^Draw_List) ---
	ImDrawList_PushTextureID               :: proc(self: ^Draw_List, texture_id: Texture_ID) ---
	ImDrawList__CalcCircleAutoSegmentCount :: proc(self: ^Draw_List, radius: f32) -> i32 ---
	ImDrawList__ClearFreeMemory            :: proc(self: ^Draw_List) ---
	ImDrawList__OnChangedClipRect          :: proc(self: ^Draw_List) ---
	ImDrawList__OnChangedTextureID         :: proc(self: ^Draw_List) ---
	ImDrawList__OnChangedVtxOffset         :: proc(self: ^Draw_List) ---
	ImDrawList__PathArcToFastEx            :: proc(self: ^Draw_List, center: Vec2, radius: f32, a_min_sample: i32, a_max_sample: i32, a_step: i32) ---
	ImDrawList__PathArcToN                 :: proc(self: ^Draw_List, center: Vec2, radius: f32, a_min: f32, a_max: f32, num_segments: i32) ---
	ImDrawList__PopUnusedDrawCmd           :: proc(self: ^Draw_List) ---
	ImDrawList__ResetForNewFrame           :: proc(self: ^Draw_List) ---

	ImFontAtlasCustomRect_IsPacked :: proc(self: ^Font_Atlas_Custom_Rect) -> bool ---

	ImFontAtlas_AddCustomRectFontGlyph                :: proc(self: ^Font_Atlas, font: ^ImFont, id: Wchar, width: i32, height: i32, advance_x: f32, offset: Vec2) -> i32 ---
	ImFontAtlas_AddCustomRectRegular                  :: proc(self: ^Font_Atlas, width: i32, height: i32) -> i32 ---
	ImFontAtlas_AddFont                               :: proc(self: ^Font_Atlas, font_cfg: ^Font_Config) -> ^ImFont ---
	ImFontAtlas_AddFontDefault                        :: proc(self: ^Font_Atlas, font_cfg: ^Font_Config) -> ^ImFont ---
	ImFontAtlas_AddFontFromFileTTF                    :: proc(self: ^Font_Atlas, filename: cstring, size_pixels: f32, font_cfg: ^Font_Config, glyph_ranges: ^Wchar) -> ^ImFont ---
	ImFontAtlas_AddFontFromMemoryCompressedBase85TTF  :: proc(self: ^Font_Atlas, compressed_font_data_base85: cstring, size_pixels: f32, font_cfg: ^Font_Config, glyph_ranges: ^Wchar) -> ^ImFont ---
	ImFontAtlas_AddFontFromMemoryCompressedTTF        :: proc(self: ^Font_Atlas, compressed_font_data: rawptr, compressed_font_size: i32, size_pixels: f32, font_cfg: ^Font_Config, glyph_ranges: ^Wchar) -> ^ImFont ---
	ImFontAtlas_AddFontFromMemoryTTF                  :: proc(self: ^Font_Atlas, font_data: rawptr, font_size: i32, size_pixels: f32, font_cfg: ^Font_Config, glyph_ranges: ^Wchar) -> ^ImFont ---
	ImFontAtlas_Build                                 :: proc(self: ^Font_Atlas) -> bool ---
	ImFontAtlas_CalcCustomRectUV                      :: proc(self: ^Font_Atlas, rect: ^Font_Atlas_Custom_Rect, out_uv_min: ^Vec2, out_uv_max: ^Vec2) ---
	ImFontAtlas_Clear                                 :: proc(self: ^Font_Atlas) ---
	ImFontAtlas_ClearFonts                            :: proc(self: ^Font_Atlas) ---
	ImFontAtlas_ClearInputData                        :: proc(self: ^Font_Atlas) ---
	ImFontAtlas_ClearTexData                          :: proc(self: ^Font_Atlas) ---
	ImFontAtlas_GetCustomRectByIndex                  :: proc(self: ^Font_Atlas, index: i32) -> ^Font_Atlas_Custom_Rect ---
	ImFontAtlas_GetGlyphRangesChineseFull             :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesCyrillic                :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesDefault                 :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesJapanese                :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesKorean                  :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesThai                    :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetGlyphRangesVietnamese              :: proc(self: ^Font_Atlas) -> ^Wchar ---
	ImFontAtlas_GetMouseCursorTexData                 :: proc(self: ^Font_Atlas, cursor: Mouse_Cursor, out_offset: ^Vec2, out_size: ^Vec2, out_uv_border: [^]Vec2, out_uv_fill: [^]Vec2) -> bool ---
	ImFontAtlas_GetTexDataAsAlpha8                    :: proc(self: ^Font_Atlas, out_pixels: ^^u8, out_width: ^i32, out_height: ^i32, out_bytes_per_pixel: ^i32) ---
	ImFontAtlas_GetTexDataAsRGBA32                    :: proc(self: ^Font_Atlas, out_pixels: ^^u8, out_width: ^i32, out_height: ^i32, out_bytes_per_pixel: ^i32) ---
	ImFontAtlas_IsBuilt                               :: proc(self: ^Font_Atlas) -> bool ---
	ImFontAtlas_SetTexID                              :: proc(self: ^Font_Atlas, id: Texture_ID) ---

	ImFontGlyphRangesBuilder_AddChar     :: proc(self: ^Font_Glyph_Ranges_Builder, c: Wchar) ---
	ImFontGlyphRangesBuilder_AddRanges   :: proc(self: ^Font_Glyph_Ranges_Builder, ranges: ^Wchar) ---
	ImFontGlyphRangesBuilder_AddText     :: proc(self: ^Font_Glyph_Ranges_Builder, text: cstring, text_end: cstring) ---
	ImFontGlyphRangesBuilder_BuildRanges :: proc(self: ^Font_Glyph_Ranges_Builder, out_ranges: ^Im_Vector(Wchar)) ---
	ImFontGlyphRangesBuilder_Clear       :: proc(self: ^Font_Glyph_Ranges_Builder) ---
	ImFontGlyphRangesBuilder_GetBit      :: proc(self: ^Font_Glyph_Ranges_Builder, n: uint) -> bool ---
	ImFontGlyphRangesBuilder_SetBit      :: proc(self: ^Font_Glyph_Ranges_Builder, n: uint) ---

	ImFont_AddGlyph              :: proc(self: ^ImFont, src_cfg: ^Font_Config, c: Wchar, x0: f32, y0: f32, x1: f32, y1: f32, u0: f32, v0: f32, u1: f32, v1: f32, advance_x: f32) ---
	ImFont_AddRemapChar          :: proc(self: ^ImFont, dst: Wchar, src: Wchar, overwrite_dst: bool) ---
	ImFont_BuildLookupTable      :: proc(self: ^ImFont) ---
	ImFont_CalcTextSizeA         :: proc(pOut: ^Vec2, self: ^ImFont, size: f32, max_width: f32, wrap_width: f32, text_begin: cstring, text_end: cstring, remaining: ^cstring) ---
	ImFont_CalcWordWrapPositionA :: proc(self: ^ImFont, scale: f32, text: cstring, text_end: cstring, wrap_width: f32) -> cstring ---
	ImFont_ClearOutputData       :: proc(self: ^ImFont) ---
	ImFont_FindGlyph             :: proc(self: ^ImFont, c: Wchar) -> ^Font_Glyph ---
	ImFont_FindGlyphNoFallback   :: proc(self: ^ImFont, c: Wchar) -> ^Font_Glyph ---
	ImFont_GetCharAdvance        :: proc(self: ^ImFont, c: Wchar) -> f32 ---
	ImFont_GetDebugName          :: proc(self: ^ImFont) -> cstring ---
	ImFont_GrowIndex             :: proc(self: ^ImFont, new_size: i32) ---
	ImFont_IsGlyphRangeUnused    :: proc(self: ^ImFont, c_begin: u32, c_last: u32) -> bool ---
	ImFont_IsLoaded              :: proc(self: ^ImFont) -> bool ---
	ImFont_RenderChar            :: proc(self: ^ImFont, draw_list: ^Draw_List, size: f32, pos: Vec2, col: u32, c: Wchar) ---
	ImFont_RenderText            :: proc(self: ^ImFont, draw_list: ^Draw_List, size: f32, pos: Vec2, col: u32, clip_rect: Vec4, text_begin: cstring, text_end: cstring, wrap_width: f32, cpu_fine_clip: bool) ---
	ImFont_SetFallbackChar       :: proc(self: ^ImFont, c: Wchar) ---
	ImFont_SetGlyphVisible       :: proc(self: ^ImFont, c: Wchar, visible: bool) ---

	ImGuiIO_AddInputCharacter      :: proc(self: ^IO, c: u32) ---
	ImGuiIO_AddInputCharacterUTF16 :: proc(self: ^IO, c: Wchar16) ---
	ImGuiIO_AddInputCharactersUTF8 :: proc(self: ^IO, str: cstring) ---
	ImGuiIO_ClearInputCharacters   :: proc(self: ^IO) ---

	ImGuiInputTextCallbackData_ClearSelection :: proc(self: ^Input_Text_Callback_Data) ---
	ImGuiInputTextCallbackData_DeleteChars    :: proc(self: ^Input_Text_Callback_Data, pos: i32, bytes_count: i32) ---
	ImGuiInputTextCallbackData_HasSelection   :: proc(self: ^Input_Text_Callback_Data) -> bool ---
	ImGuiInputTextCallbackData_InsertChars    :: proc(self: ^Input_Text_Callback_Data, pos: i32, text: cstring, text_end: cstring) ---
	ImGuiInputTextCallbackData_SelectAll      :: proc(self: ^Input_Text_Callback_Data) ---

	ImGuiListClipper_Begin :: proc(self: ^List_Clipper, items_count: i32, items_height: f32) ---
	ImGuiListClipper_End   :: proc(self: ^List_Clipper) ---
	ImGuiListClipper_Step  :: proc(self: ^List_Clipper) -> bool ---

	ImGuiPayload_Clear      :: proc(self: ^Payload) ---
	ImGuiPayload_IsDataType :: proc(self: ^Payload, type: cstring) -> bool ---
	ImGuiPayload_IsDelivery :: proc(self: ^Payload) -> bool ---
	ImGuiPayload_IsPreview  :: proc(self: ^Payload) -> bool ---

	ImGuiStorage_BuildSortByKey :: proc(self: ^Storage) ---
	ImGuiStorage_Clear          :: proc(self: ^Storage) ---
	ImGuiStorage_GetBool        :: proc(self: ^Storage, key: ImID, default_val: bool) -> bool ---
	ImGuiStorage_GetBoolRef     :: proc(self: ^Storage, key: ImID, default_val: bool) -> ^bool ---
	ImGuiStorage_GetFloat       :: proc(self: ^Storage, key: ImID, default_val: f32) -> f32 ---
	ImGuiStorage_GetFloatRef    :: proc(self: ^Storage, key: ImID, default_val: f32) -> ^f32 ---
	ImGuiStorage_GetInt         :: proc(self: ^Storage, key: ImID, default_val: i32) -> i32 ---
	ImGuiStorage_GetIntRef      :: proc(self: ^Storage, key: ImID, default_val: i32) -> ^i32 ---
	ImGuiStorage_GetVoidPtr     :: proc(self: ^Storage, key: ImID) -> rawptr ---
	ImGuiStorage_GetVoidPtrRef  :: proc(self: ^Storage, key: ImID, default_val: rawptr) -> ^rawptr ---
	ImGuiStorage_SetAllInt      :: proc(self: ^Storage, val: i32) ---
	ImGuiStorage_SetBool        :: proc(self: ^Storage, key: ImID, val: bool) ---
	ImGuiStorage_SetFloat       :: proc(self: ^Storage, key: ImID, val: f32) ---
	ImGuiStorage_SetInt         :: proc(self: ^Storage, key: ImID, val: i32) ---
	ImGuiStorage_SetVoidPtr     :: proc(self: ^Storage, key: ImID, val: rawptr) ---

	ImGuiStyle_ScaleAllSizes :: proc(self: ^Style, scale_factor: f32) ---

	ImGuiTextBuffer_append  :: proc(self: ^Text_Buffer, str: cstring, str_end: cstring) ---
	ImGuiTextBuffer_appendf :: proc(self: ^Text_Buffer, fmt_: cstring, #c_vararg args: ..any) ---
	ImGuiTextBuffer_begin   :: proc(self: ^Text_Buffer) -> cstring ---
	ImGuiTextBuffer_c_str   :: proc(self: ^Text_Buffer) -> cstring ---
	ImGuiTextBuffer_clear   :: proc(self: ^Text_Buffer) ---
	ImGuiTextBuffer_empty   :: proc(self: ^Text_Buffer) -> bool ---
	ImGuiTextBuffer_end     :: proc(self: ^Text_Buffer) -> cstring ---
	ImGuiTextBuffer_reserve :: proc(self: ^Text_Buffer, capacity: i32) ---
	ImGuiTextBuffer_size    :: proc(self: ^Text_Buffer) -> i32 ---

	ImGuiTextFilter_Build      :: proc(self: ^Text_Filter) ---
	ImGuiTextFilter_Clear      :: proc(self: ^Text_Filter) ---
	ImGuiTextFilter_Draw       :: proc(self: ^Text_Filter, label: cstring, width: f32) -> bool ---
	ImGuiTextFilter_IsActive   :: proc(self: ^Text_Filter) -> bool ---
	ImGuiTextFilter_PassFilter :: proc(self: ^Text_Filter, text: cstring, text_end: cstring) -> bool ---

	ImGuiTextRange_empty :: proc(self: ^Text_Range) -> bool ---
	ImGuiTextRange_split :: proc(self: ^Text_Range, separator: i8, out: ^Im_Vector(Text_Range)) ---

	ImGuiViewport_GetCenter     :: proc(pOut: ^Vec2, self: ^Viewport) ---
	ImGuiViewport_GetWorkCenter :: proc(pOut: ^Vec2, self: ^Viewport) ---

	igAcceptDragDropPayload            :: proc(type: cstring, flags: Drag_Drop_Flags) -> ^Payload ---
	igAlignTextToFramePadding          :: proc() ---
	igArrowButton                      :: proc(str_id: cstring, dir: Dir) -> bool ---
	igBegin                            :: proc(name: cstring, p_open: ^bool, flags: Window_Flags) -> bool ---
	igBeginChild_Str                   :: proc(str_id: cstring, size: Vec2, border: bool, flags: Window_Flags) -> bool ---
	igBeginChild_ID                    :: proc(id: ImID, size: Vec2, border: bool, flags: Window_Flags) -> bool ---
	igBeginChildFrame                  :: proc(id: ImID, size: Vec2, flags: Window_Flags) -> bool ---
	igBeginCombo                       :: proc(label: cstring, preview_value: cstring, flags: Combo_Flags) -> bool ---
	igBeginDragDropSource              :: proc(flags: Drag_Drop_Flags) -> bool ---
	igBeginDragDropTarget              :: proc() -> bool ---
	igBeginGroup                       :: proc() ---
	igBeginListBox                     :: proc(label: cstring, size: Vec2) -> bool ---
	igBeginMainMenuBar                 :: proc() -> bool ---
	igBeginMenu                        :: proc(label: cstring, enabled: bool) -> bool ---
	igBeginMenuBar                     :: proc() -> bool ---
	igBeginPopup                       :: proc(str_id: cstring, flags: Window_Flags) -> bool ---
	igBeginPopupContextItem            :: proc(str_id: cstring, popup_flags: Popup_Flags) -> bool ---
	igBeginPopupContextVoid            :: proc(str_id: cstring, popup_flags: Popup_Flags) -> bool ---
	igBeginPopupContextWindow          :: proc(str_id: cstring, popup_flags: Popup_Flags) -> bool ---
	igBeginPopupModal                  :: proc(name: cstring, p_open: ^bool, flags: Window_Flags) -> bool ---
	igBeginTabBar                      :: proc(str_id: cstring, flags: Tab_Bar_Flags) -> bool ---
	igBeginTabItem                     :: proc(label: cstring, p_open: ^bool, flags: Tab_Item_Flags) -> bool ---
	igBeginTable                       :: proc(str_id: cstring, column: i32, flags: Table_Flags, outer_size: Vec2, inner_width: f32) -> bool ---
	igBeginTooltip                     :: proc() ---
	igBullet                           :: proc() ---
	igBulletText                       :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igButton                           :: proc(label: cstring, size: Vec2) -> bool ---
	igCalcItemWidth                    :: proc() -> f32 ---
	igCalcListClipping                 :: proc(items_count: i32, items_height: f32, out_items_display_start: ^i32, out_items_display_end: ^i32) ---
	igCalcTextSize                     :: proc(pOut: ^Vec2, text: cstring, text_end: cstring, hide_text_after_double_hash: bool, wrap_width: f32) ---
	igCaptureKeyboardFromApp           :: proc(want_capture_keyboard_value: bool) ---
	igCaptureMouseFromApp              :: proc(want_capture_mouse_value: bool) ---
	igCheckbox                         :: proc(label: cstring, v: ^bool) -> bool ---
	igCheckboxFlags_IntPtr             :: proc(label: cstring, flags: ^i32, flags_value: i32) -> bool ---
	igCheckboxFlags_UintPtr            :: proc(label: cstring, flags: ^u32, flags_value: u32) -> bool ---
	igCloseCurrentPopup                :: proc() ---
	igCollapsingHeader_TreeNodeFlags   :: proc(label: cstring, flags: Tree_Node_Flags) -> bool ---
	igCollapsingHeader_BoolPtr         :: proc(label: cstring, p_visible: ^bool, flags: Tree_Node_Flags) -> bool ---
	igColorButton                      :: proc(desc_id: cstring, col: Vec4, flags: Color_Edit_Flags, size: Vec2) -> bool ---
	igColorConvertFloat4ToU32          :: proc(in_: Vec4) -> u32 ---
	igColorConvertHSVtoRGB             :: proc(h: f32, s: f32, v: f32, out_r: ^f32, out_g: ^f32, out_b: ^f32) ---
	igColorConvertRGBtoHSV             :: proc(r: f32, g: f32, b: f32, out_h: ^f32, out_s: ^f32, out_v: ^f32) ---
	igColorConvertU32ToFloat4          :: proc(pOut: ^Vec4, in_: u32) ---
	igColorEdit3                       :: proc(label: cstring, col: [^]f32, flags: Color_Edit_Flags) -> bool ---
	igColorEdit4                       :: proc(label: cstring, col: [^]f32, flags: Color_Edit_Flags) -> bool ---
	igColorPicker3                     :: proc(label: cstring, col: [^]f32, flags: Color_Edit_Flags) -> bool ---
	igColorPicker4                     :: proc(label: cstring, col: [^]f32, flags: Color_Edit_Flags, ref_col: ^f32) -> bool ---
	igColumns                          :: proc(count: i32, id: cstring, border: bool) ---
	igCombo_Str_arr                    :: proc(label: cstring, current_item: ^i32, items: ^cstring, items_count: i32, popup_max_height_in_items: i32) -> bool ---
	igCombo_Str                        :: proc(label: cstring, current_item: ^i32, items_separated_by_zeros: cstring, popup_max_height_in_items: i32) -> bool ---
	igCombo_FnBoolPtr                  :: proc(label: cstring, current_item: ^i32, items_getter: Items_Getter_Proc, data: rawptr, items_count: i32, popup_max_height_in_items: i32) -> bool ---
	igCreateContext                    :: proc(shared_font_atlas: ^Font_Atlas) -> ^Context ---
	igDebugCheckVersionAndDataLayout   :: proc(version_str: cstring, sz_io: uint, sz_style: uint, sz_vec2: uint, sz_vec4: uint, sz_drawvert: uint, sz_drawidx: uint) -> bool ---
	igDestroyContext                   :: proc(ctx: ^Context) ---
	igDragFloat                        :: proc(label: cstring, v: ^f32, v_speed: f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragFloat2                       :: proc(label: cstring, v: [^]f32, v_speed: f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragFloat3                       :: proc(label: cstring, v: [^]f32, v_speed: f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragFloat4                       :: proc(label: cstring, v: [^]f32, v_speed: f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragFloatRange2                  :: proc(label: cstring, v_current_min: ^f32, v_current_max: ^f32, v_speed: f32, v_min: f32, v_max: f32, format: cstring, format_max: cstring, flags: Slider_Flags) -> bool ---
	igDragInt                          :: proc(label: cstring, v: ^i32, v_speed: f32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragInt2                         :: proc(label: cstring, v: [^]i32, v_speed: f32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragInt3                         :: proc(label: cstring, v: [^]i32, v_speed: f32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragInt4                         :: proc(label: cstring, v: [^]i32, v_speed: f32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igDragIntRange2                    :: proc(label: cstring, v_current_min: ^i32, v_current_max: ^i32, v_speed: f32, v_min: i32, v_max: i32, format: cstring, format_max: cstring, flags: Slider_Flags) -> bool ---
	igDragScalar                       :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, v_speed: f32, p_min: rawptr, p_max: rawptr, format: cstring, flags: Slider_Flags) -> bool ---
	igDragScalarN                      :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, components: i32, v_speed: f32, p_min: rawptr, p_max: rawptr, format: cstring, flags: Slider_Flags) -> bool ---
	igDummy                            :: proc(size: Vec2) ---
	igEnd                              :: proc() ---
	igEndChild                         :: proc() ---
	igEndChildFrame                    :: proc() ---
	igEndCombo                         :: proc() ---
	igEndDragDropSource                :: proc() ---
	igEndDragDropTarget                :: proc() ---
	igEndFrame                         :: proc() ---
	igEndGroup                         :: proc() ---
	igEndListBox                       :: proc() ---
	igEndMainMenuBar                   :: proc() ---
	igEndMenu                          :: proc() ---
	igEndMenuBar                       :: proc() ---
	igEndPopup                         :: proc() ---
	igEndTabBar                        :: proc() ---
	igEndTabItem                       :: proc() ---
	igEndTable                         :: proc() ---
	igEndTooltip                       :: proc() ---
	igGetAllocatorFunctions            :: proc(p_alloc_func: ^Mem_Alloc_Func, p_free_func: ^Mem_Free_Func, p_user_data: ^rawptr) ---
	igGetBackgroundDrawList_Nil        :: proc() -> ^Draw_List ---
	igGetClipboardText                 :: proc() -> cstring ---
	igGetColorU32_Col                  :: proc(idx: Col, alpha_mul: f32) -> u32 ---
	igGetColorU32_Vec4                 :: proc(col: Vec4) -> u32 ---
	igGetColorU32_U32                  :: proc(col: u32) -> u32 ---
	igGetColumnIndex                   :: proc() -> i32 ---
	igGetColumnOffset                  :: proc(column_index: i32) -> f32 ---
	igGetColumnWidth                   :: proc(column_index: i32) -> f32 ---
	igGetColumnsCount                  :: proc() -> i32 ---
	igGetContentRegionAvail            :: proc(pOut: ^Vec2) ---
	igGetContentRegionMax              :: proc(pOut: ^Vec2) ---
	igGetCurrentContext                :: proc() -> ^Context ---
	igGetCursorPos                     :: proc(pOut: ^Vec2) ---
	igGetCursorPosX                    :: proc() -> f32 ---
	igGetCursorPosY                    :: proc() -> f32 ---
	igGetCursorScreenPos               :: proc(pOut: ^Vec2) ---
	igGetCursorStartPos                :: proc(pOut: ^Vec2) ---
	igGetDragDropPayload               :: proc() -> ^Payload ---
	igGetDrawData                      :: proc() -> ^Draw_Data ---
	igGetDrawListSharedData            :: proc() -> ^Draw_List_Shared_Data ---
	igGetFont                          :: proc() -> ^ImFont ---
	igGetFontSize                      :: proc() -> f32 ---
	igGetFontTexUvWhitePixel           :: proc(pOut: ^Vec2) ---
	igGetForegroundDrawList_Nil        :: proc() -> ^Draw_List ---
	igGetFrameCount                    :: proc() -> i32 ---
	igGetFrameHeight                   :: proc() -> f32 ---
	igGetFrameHeightWithSpacing        :: proc() -> f32 ---
	igGetID_Str                        :: proc(str_id: cstring) -> ImID ---
	igGetID_StrStr                     :: proc(str_id_begin: cstring, str_id_end: cstring) -> ImID ---
	igGetID_Ptr                        :: proc(ptr_id: rawptr) -> ImID ---
	igGetIO                            :: proc() -> ^IO ---
	igGetItemRectMax                   :: proc(pOut: ^Vec2) ---
	igGetItemRectMin                   :: proc(pOut: ^Vec2) ---
	igGetItemRectSize                  :: proc(pOut: ^Vec2) ---
	igGetKeyIndex                      :: proc(imgui_key: Key) -> i32 ---
	igGetKeyPressedAmount              :: proc(key_index: i32, repeat_delay: f32, rate: f32) -> i32 ---
	igGetMainViewport                  :: proc() -> ^Viewport ---
	igGetMouseCursor                   :: proc() -> Mouse_Cursor ---
	igGetMouseDragDelta                :: proc(pOut: ^Vec2, button: Mouse_Button, lock_threshold: f32) ---
	igGetMousePos                      :: proc(pOut: ^Vec2) ---
	igGetMousePosOnOpeningCurrentPopup :: proc(pOut: ^Vec2) ---
	igGetScrollMaxX                    :: proc() -> f32 ---
	igGetScrollMaxY                    :: proc() -> f32 ---
	igGetScrollX                       :: proc() -> f32 ---
	igGetScrollY                       :: proc() -> f32 ---
	igGetStateStorage                  :: proc() -> ^Storage ---
	igGetStyle                         :: proc() -> ^Style ---
	igGetStyleColorName                :: proc(idx: Col) -> cstring ---
	igGetStyleColorVec4                :: proc(idx: Col) -> ^Vec4 ---
	igGetTextLineHeight                :: proc() -> f32 ---
	igGetTextLineHeightWithSpacing     :: proc() -> f32 ---
	igGetTime                          :: proc() -> f64 ---
	igGetTreeNodeToLabelSpacing        :: proc() -> f32 ---
	igGetVersion                       :: proc() -> cstring ---
	igGetWindowContentRegionMax        :: proc(pOut: ^Vec2) ---
	igGetWindowContentRegionMin        :: proc(pOut: ^Vec2) ---
	igGetWindowContentRegionWidth      :: proc() -> f32 ---
	igGetWindowDrawList                :: proc() -> ^Draw_List ---
	igGetWindowHeight                  :: proc() -> f32 ---
	igGetWindowPos                     :: proc(pOut: ^Vec2) ---
	igGetWindowSize                    :: proc(pOut: ^Vec2) ---
	igGetWindowWidth                   :: proc() -> f32 ---
	igImage                            :: proc(user_texture_id: Texture_ID, size: Vec2, uv0: Vec2, uv1: Vec2, tint_col: Vec4, border_col: Vec4) ---
	igImageButton                      :: proc(user_texture_id: Texture_ID, size: Vec2, uv0: Vec2, uv1: Vec2, frame_padding: i32, bg_col: Vec4, tint_col: Vec4) -> bool ---
	igIndent                           :: proc(indent_w: f32) ---
	igInputDouble                      :: proc(label: cstring, v: ^f64, step: f64, step_fast: f64, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputFloat                       :: proc(label: cstring, v: ^f32, step: f32, step_fast: f32, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputFloat2                      :: proc(label: cstring, v: [^]f32, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputFloat3                      :: proc(label: cstring, v: [^]f32, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputFloat4                      :: proc(label: cstring, v: [^]f32, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputInt                         :: proc(label: cstring, v: ^i32, step: i32, step_fast: i32, flags: Input_Text_Flags) -> bool ---
	igInputInt2                        :: proc(label: cstring, v: [^]i32, flags: Input_Text_Flags) -> bool ---
	igInputInt3                        :: proc(label: cstring, v: [^]i32, flags: Input_Text_Flags) -> bool ---
	igInputInt4                        :: proc(label: cstring, v: [^]i32, flags: Input_Text_Flags) -> bool ---
	igInputScalar                      :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, p_step: rawptr, p_step_fast: rawptr, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputScalarN                     :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, components: i32, p_step: rawptr, p_step_fast: rawptr, format: cstring, flags: Input_Text_Flags) -> bool ---
	igInputText                        :: proc(label: cstring, buf: cstring, buf_size: uint, flags: Input_Text_Flags, callback: Input_Text_Callback, user_data: rawptr) -> bool ---
	igInputTextMultiline               :: proc(label: cstring, buf: cstring, buf_size: uint, size: Vec2, flags: Input_Text_Flags, callback: Input_Text_Callback, user_data: rawptr) -> bool ---
	igInputTextWithHint                :: proc(label: cstring, hint: cstring, buf: cstring, buf_size: uint, flags: Input_Text_Flags, callback: Input_Text_Callback, user_data: rawptr) -> bool ---
	igInvisibleButton                  :: proc(str_id: cstring, size: Vec2, flags: Button_Flags) -> bool ---
	igIsAnyItemActive                  :: proc() -> bool ---
	igIsAnyItemFocused                 :: proc() -> bool ---
	igIsAnyItemHovered                 :: proc() -> bool ---
	igIsAnyMouseDown                   :: proc() -> bool ---
	igIsItemActivated                  :: proc() -> bool ---
	igIsItemActive                     :: proc() -> bool ---
	igIsItemClicked                    :: proc(mouse_button: Mouse_Button) -> bool ---
	igIsItemDeactivated                :: proc() -> bool ---
	igIsItemDeactivatedAfterEdit       :: proc() -> bool ---
	igIsItemEdited                     :: proc() -> bool ---
	igIsItemFocused                    :: proc() -> bool ---
	igIsItemHovered                    :: proc(flags: Hovered_Flags) -> bool ---
	igIsItemToggledOpen                :: proc() -> bool ---
	igIsItemVisible                    :: proc() -> bool ---
	igIsKeyDown                        :: proc(user_key_index: i32) -> bool ---
	igIsKeyPressed                     :: proc(user_key_index: i32, repeat: bool) -> bool ---
	igIsKeyReleased                    :: proc(user_key_index: i32) -> bool ---
	igIsMouseClicked                   :: proc(button: Mouse_Button, repeat: bool) -> bool ---
	igIsMouseDoubleClicked             :: proc(button: Mouse_Button) -> bool ---
	igIsMouseDown                      :: proc(button: Mouse_Button) -> bool ---
	igIsMouseDragging                  :: proc(button: Mouse_Button, lock_threshold: f32) -> bool ---
	igIsMouseHoveringRect              :: proc(r_min: Vec2, r_max: Vec2, clip: bool) -> bool ---
	igIsMousePosValid                  :: proc(mouse_pos: ^Vec2) -> bool ---
	igIsMouseReleased                  :: proc(button: Mouse_Button) -> bool ---
	igIsPopupOpen_Str                  :: proc(str_id: cstring, flags: Popup_Flags) -> bool ---
	igIsRectVisible_Nil                :: proc(size: Vec2) -> bool ---
	igIsRectVisible_Vec2               :: proc(rect_min: Vec2, rect_max: Vec2) -> bool ---
	igIsWindowAppearing                :: proc() -> bool ---
	igIsWindowCollapsed                :: proc() -> bool ---
	igIsWindowFocused                  :: proc(flags: Focused_Flags) -> bool ---
	igIsWindowHovered                  :: proc(flags: Hovered_Flags) -> bool ---
	igLabelText                        :: proc(label: cstring, fmt_: cstring, #c_vararg args: ..any) ---
	igListBox_Str_arr                  :: proc(label: cstring, current_item: ^i32, items: cstring, items_count: i32, height_in_items: i32) -> bool ---
	igListBox_FnBoolPtr                :: proc(label: cstring, current_item: ^i32, items_getter: Items_Getter_Proc, data: rawptr, items_count: i32, height_in_items: i32) -> bool ---
	igLoadIniSettingsFromDisk          :: proc(ini_filename: cstring) ---
	igLoadIniSettingsFromMemory        :: proc(ini_data: cstring, ini_size: uint) ---
	igLogButtons                       :: proc() ---
	igLogFinish                        :: proc() ---
	igLogText                          :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igLogToClipboard                   :: proc(auto_open_depth: i32) ---
	igLogToFile                        :: proc(auto_open_depth: i32, filename: cstring) ---
	igLogToTTY                         :: proc(auto_open_depth: i32) ---
	igMemAlloc                         :: proc(size: uint) -> rawptr ---
	igMemFree                          :: proc(ptr: rawptr) ---
	igMenuItem_Bool                    :: proc(label: cstring, shortcut: cstring, selected: bool, enabled: bool) -> bool ---
	igMenuItem_BoolPtr                 :: proc(label: cstring, shortcut: cstring, p_selected: ^bool, enabled: bool) -> bool ---
	igNewFrame                         :: proc() ---
	igNewLine                          :: proc() ---
	igNextColumn                       :: proc() ---
	igOpenPopup                        :: proc(str_id: cstring, popup_flags: Popup_Flags) ---
	igOpenPopupOnItemClick             :: proc(str_id: cstring, popup_flags: Popup_Flags) ---
	igPlotHistogram_FloatPtr           :: proc(label: cstring, values: ^f32, values_count: i32, values_offset: i32, overlay_text: cstring, scale_min: f32, scale_max: f32, graph_size: Vec2, stride: i32) ---
	igPlotHistogram_FnFloatPtr         :: proc(label: cstring, values_getter: Value_Getter_Proc, data: rawptr, values_count: i32, values_offset: i32, overlay_text: cstring, scale_min: f32, scale_max: f32, graph_size: Vec2) ---
	igPlotLines_FloatPtr               :: proc(label: cstring, values: ^f32, values_count: i32, values_offset: i32, overlay_text: cstring, scale_min: f32, scale_max: f32, graph_size: Vec2, stride: i32) ---
	igPlotLines_FnFloatPtr             :: proc(label: cstring, values_getter: Value_Getter_Proc, data: rawptr, values_count: i32, values_offset: i32, overlay_text: cstring, scale_min: f32, scale_max: f32, graph_size: Vec2) ---
	igPopAllowKeyboardFocus            :: proc() ---
	igPopButtonRepeat                  :: proc() ---
	igPopClipRect                      :: proc() ---
	igPopFont                          :: proc() ---
	igPopID                            :: proc() ---
	igPopItemWidth                     :: proc() ---
	igPopStyleColor                    :: proc(count: i32) ---
	igPopStyleVar                      :: proc(count: i32) ---
	igPopTextWrapPos                   :: proc() ---
	igProgressBar                      :: proc(fraction: f32, size_arg: Vec2, overlay: cstring) ---
	igPushAllowKeyboardFocus           :: proc(allow_keyboard_focus: bool) ---
	igPushButtonRepeat                 :: proc(repeat: bool) ---
	igPushClipRect                     :: proc(clip_rect_min: Vec2, clip_rect_max: Vec2, intersect_with_current_clip_rect: bool) ---
	igPushFont                         :: proc(font: ^ImFont) ---
	igPushID_Str                       :: proc(str_id: cstring) ---
	igPushID_StrStr                    :: proc(str_id_begin: cstring, str_id_end: cstring) ---
	igPushID_Ptr                       :: proc(ptr_id: rawptr) ---
	igPushID_Int                       :: proc(int_id: i32) ---
	igPushItemWidth                    :: proc(item_width: f32) ---
	igPushStyleColor_U32               :: proc(idx: Col, col: u32) ---
	igPushStyleColor_Vec4              :: proc(idx: Col, col: Vec4) ---
	igPushStyleVar_Float               :: proc(idx: Style_Var, val: f32) ---
	igPushStyleVar_Vec2                :: proc(idx: Style_Var, val: Vec2) ---
	igPushTextWrapPos                  :: proc(wrap_local_pos_x: f32) ---
	igRadioButton_Bool                 :: proc(label: cstring, active: bool) -> bool ---
	igRadioButton_IntPtr               :: proc(label: cstring, v: ^i32, v_button: i32) -> bool ---
	igRender                           :: proc() ---
	igResetMouseDragDelta              :: proc(button: Mouse_Button) ---
	igSameLine                         :: proc(offset_from_start_x: f32, spacing: f32) ---
	igSaveIniSettingsToDisk            :: proc(ini_filename: cstring) ---
	igSaveIniSettingsToMemory          :: proc(out_ini_size: ^uint) -> cstring ---
	igSelectable_Bool                  :: proc(label: cstring, selected: bool, flags: Selectable_Flags, size: Vec2) -> bool ---
	igSelectable_BoolPtr               :: proc(label: cstring, p_selected: ^bool, flags: Selectable_Flags, size: Vec2) -> bool ---
	igSeparator                        :: proc() ---
	igSetAllocatorFunctions            :: proc(alloc_func: Alloc_Func, free_func: Free_Func) ---
	igSetClipboardText                 :: proc(text: cstring) ---
	igSetColorEditOptions              :: proc(flags: Color_Edit_Flags) ---
	igSetColumnOffset                  :: proc(column_index: i32, offset_x: f32) ---
	igSetColumnWidth                   :: proc(column_index: i32, width: f32) ---
	igSetCurrentContext                :: proc(ctx: ^Context) ---
	igSetCursorPos                     :: proc(local_pos: Vec2) ---
	igSetCursorPosX                    :: proc(local_x: f32) ---
	igSetCursorPosY                    :: proc(local_y: f32) ---
	igSetCursorScreenPos               :: proc(pos: Vec2) ---
	igSetDragDropPayload               :: proc(type: cstring, data: rawptr, sz: uint, cond: Cond) -> bool ---
	igSetItemAllowOverlap              :: proc() ---
	igSetItemDefaultFocus              :: proc() ---
	igSetKeyboardFocusHere             :: proc(offset: i32) ---
	igSetMouseCursor                   :: proc(cursor_type: Mouse_Cursor) ---
	igSetNextItemOpen                  :: proc(is_open: bool, cond: Cond) ---
	igSetNextItemWidth                 :: proc(item_width: f32) ---
	igSetNextWindowBgAlpha             :: proc(alpha: f32) ---
	igSetNextWindowCollapsed           :: proc(collapsed: bool, cond: Cond) ---
	igSetNextWindowContentSize         :: proc(size: Vec2) ---
	igSetNextWindowFocus               :: proc() ---
	igSetNextWindowPos                 :: proc(pos: Vec2, cond: Cond, pivot: Vec2) ---
	igSetNextWindowSize                :: proc(size: Vec2, cond: Cond) ---
	igSetNextWindowSizeConstraints     :: proc(size_min: Vec2, size_max: Vec2, custom_callback: Size_Callback, custom_callback_data: rawptr) ---
	igSetScrollFromPosX_Float          :: proc(local_x: f32, center_x_ratio: f32) ---
	igSetScrollFromPosY_Float          :: proc(local_y: f32, center_y_ratio: f32) ---
	igSetScrollHereX                   :: proc(center_x_ratio: f32) ---
	igSetScrollHereY                   :: proc(center_y_ratio: f32) ---
	igSetScrollX_Float                 :: proc(scroll_x: f32) ---
	igSetScrollY_Float                 :: proc(scroll_y: f32) ---
	igSetStateStorage                  :: proc(storage: ^Storage) ---
	igSetTabItemClosed                 :: proc(tab_or_docked_window_label: cstring) ---
	igSetTooltip                       :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igSetWindowCollapsed_Bool          :: proc(collapsed: bool, cond: Cond) ---
	igSetWindowCollapsed_Str           :: proc(name: cstring, collapsed: bool, cond: Cond) ---
	igSetWindowFocus_Nil               :: proc() ---
	igSetWindowFocus_Str               :: proc(name: cstring) ---
	igSetWindowFontScale               :: proc(scale: f32) ---
	igSetWindowPos_Vec2                :: proc(pos: Vec2, cond: Cond) ---
	igSetWindowPos_Str                 :: proc(name: cstring, pos: Vec2, cond: Cond) ---
	igSetWindowSize_Vec2               :: proc(size: Vec2, cond: Cond) ---
	igSetWindowSize_Str                :: proc(name: cstring, size: Vec2, cond: Cond) ---
	igShowAboutWindow                  :: proc(p_open: ^bool) ---
	igShowDemoWindow                   :: proc(p_open: ^bool) ---
	igShowFontSelector                 :: proc(label: cstring) ---
	igShowMetricsWindow                :: proc(p_open: ^bool) ---
	igShowStyleEditor                  :: proc(ref: ^Style) ---
	igShowStyleSelector                :: proc(label: cstring) -> bool ---
	igShowUserGuide                    :: proc() ---
	igSliderAngle                      :: proc(label: cstring, v_rad: ^f32, v_degrees_min: f32, v_degrees_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderFloat                      :: proc(label: cstring, v: ^f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderFloat2                     :: proc(label: cstring, v: [^]f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderFloat3                     :: proc(label: cstring, v: [^]f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderFloat4                     :: proc(label: cstring, v: [^]f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderInt                        :: proc(label: cstring, v: ^i32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderInt2                       :: proc(label: cstring, v: [^]i32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderInt3                       :: proc(label: cstring, v: [^]i32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderInt4                       :: proc(label: cstring, v: [^]i32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderScalar                     :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, p_min: rawptr, p_max: rawptr, format: cstring, flags: Slider_Flags) -> bool ---
	igSliderScalarN                    :: proc(label: cstring, data_type: Data_Type, p_data: rawptr, components: i32, p_min: rawptr, p_max: rawptr, format: cstring, flags: Slider_Flags) -> bool ---
	igSmallButton                      :: proc(label: cstring) -> bool ---
	igSpacing                          :: proc() ---
	igStyleColorsClassic               :: proc(dst: ^Style) ---
	igStyleColorsDark                  :: proc(dst: ^Style) ---
	igStyleColorsLight                 :: proc(dst: ^Style) ---
	igTabItemButton                    :: proc(label: cstring, flags: Tab_Item_Flags) -> bool ---
	igTableGetColumnCount              :: proc() -> i32 ---
	igTableGetColumnFlags              :: proc(column_n: i32) -> Table_Column_Flags ---
	igTableGetColumnIndex              :: proc() -> i32 ---
	igTableGetColumnName_Int           :: proc(column_n: i32) -> cstring ---
	igTableGetRowIndex                 :: proc() -> i32 ---
	igTableGetSortSpecs                :: proc() -> ^Table_Sort_Specs ---
	igTableHeader                      :: proc(label: cstring) ---
	igTableHeadersRow                  :: proc() ---
	igTableNextColumn                  :: proc() -> bool ---
	igTableNextRow                     :: proc(row_flags: Table_Row_Flags, min_row_height: f32) ---
	igTableSetBgColor                  :: proc(target: Table_Bg_Target, color: u32, column_n: i32) ---
	igTableSetColumnIndex              :: proc(column_n: i32) -> bool ---
	igTableSetupColumn                 :: proc(label: cstring, flags: Table_Column_Flags, init_width_or_weight: f32, user_id: ImID) ---
	igTableSetupScrollFreeze           :: proc(cols: i32, rows: i32) ---
	igText                             :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igTextColored                      :: proc(col: Vec4, fmt_: cstring, #c_vararg args: ..any) ---
	igTextDisabled                     :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igTextUnformatted                  :: proc(text: cstring, text_end: cstring) ---
	igTextWrapped                      :: proc(fmt_: cstring, #c_vararg args: ..any) ---
	igTreeNode_Str                     :: proc(label: cstring) -> bool ---
	igTreeNode_StrStr                  :: proc(str_id: cstring, fmt_: cstring, #c_vararg args: ..any) -> bool ---
	igTreeNode_Ptr                     :: proc(ptr_id: rawptr, fmt_: cstring, #c_vararg args: ..any) -> bool ---
	igTreeNodeEx_Str                   :: proc(label: cstring, flags: Tree_Node_Flags) -> bool ---
	igTreeNodeEx_StrStr                :: proc(str_id: cstring, flags: Tree_Node_Flags, fmt_: cstring, #c_vararg args: ..any) -> bool ---
	igTreeNodeEx_Ptr                   :: proc(ptr_id: rawptr, flags: Tree_Node_Flags, fmt_: cstring, #c_vararg args: ..any) -> bool ---
	igTreePop                          :: proc() ---
	igTreePush_Str                     :: proc(str_id: cstring) ---
	igTreePush_Ptr                     :: proc(ptr_id: rawptr) ---
	igUnindent                         :: proc(indent_w: f32) ---
	igVSliderFloat                     :: proc(label: cstring, size: Vec2, v: ^f32, v_min: f32, v_max: f32, format: cstring, flags: Slider_Flags) -> bool ---
	igVSliderInt                       :: proc(label: cstring, size: Vec2, v: ^i32, v_min: i32, v_max: i32, format: cstring, flags: Slider_Flags) -> bool ---
	igVSliderScalar                    :: proc(label: cstring, size: Vec2, data_type: Data_Type, p_data: rawptr, p_min: rawptr, p_max: rawptr, format: cstring, flags: Slider_Flags) -> bool ---
	igValue_Bool                       :: proc(prefix: cstring, b: bool) ---
	igValue_Int                        :: proc(prefix: cstring, v: i32) ---
	igValue_Uint                       :: proc(prefix: cstring, v: u32) ---
	igValue_Float                      :: proc(prefix: cstring, v: f32, float_format: cstring) ---

}
