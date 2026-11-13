Glyph_Atlas :: struct {
    texture: GLuint;
    ft: FT_Library;
    ft_face: FT_Face;
    hb_buffer: *hb.buffer_t;
    hb_blob: *hb.blob_t;
    hb_face: *hb.face_t;
    hb_font: *hb.font_t;
    char_map: Table(u32, Glyph_Metric);
    ascender: int;
    descender: int;
    prepared: struct {
        text: string; // Should only be used to determine whether the text should be "re-prepared".
        glyph_count: u32;
    }
}

Glyph_Metric :: struct {
    glyph_rect: Rectangle; // Bounding box of the glyph in pixels (x, y = 0).
    atlas_rect: Rectangle; // Rectangle of the glyph in the texture (normalized).
    bearing: Vector2;
}

glyph_atlas_init :: (using atlas: *Glyph_Atlas) {
    err := FT_Init_FreeType(*ft);
    ft_assert(err, "FT_Init_FreeType: %");

    err = FT_New_Memory_Face(ft, FONT_DATA.data, FONT_DATA.count, 0, *ft_face);
    ft_assert(err, "FT_New_Memory_Face: %");

    FT_Set_Char_Size(ft_face, FONT_SIZE * 64, FONT_SIZE * 64, 0, 0);
    FT_Select_Charmap(ft_face, .UNICODE);
    // Cocos2d method.
    ascender  = ft_face.size.metrics.ascender >> 6;
    descender = ft_face.size.metrics.descender >> 6;

    hb_buffer = hb.buffer_create();
    hb_blob   = hb.blob_create_or_fail(FONT_DATA.data, FONT_DATA.count, .READONLY, null, null);
    hb_face   = hb.face_create(hb_blob, 0);
    hb_font   = hb.font_create(hb_face);

    stbrp_ctx: stbrp.ctx         = ---;
    nodes: [NUM_NODES]stbrp.node = ---;
    stbrp.init_target(*stbrp_ctx, ATLAS_WIDTH, ATLAS_HEIGHT, cast(*stbrp.node, *nodes), NUM_NODES);

    init(*char_map, MAX_GLYPHS);
    rects: [MAX_GLYPHS]stbrp.rect;
    bitmaps: [MAX_GLYPHS][]u8;

    glyph_index: FT_UInt;
    // @Bad For now, we are loading all of them in the beginning.
    // This is not good (increases startup times and useless glyphs take space in the atlas)
    // Loading glyphs lazily would be a better strategy and would allow us to support Nerd Fonts etc.
    assert(MAX_GLYPHS > ft_face.num_glyphs, "Selected font is too large (% < %), increase MAX_GLYPHS or choose another font.", MAX_GLYPHS, ft_face.num_glyphs);
    for 0..ft_face.num_glyphs-1 {
        defer glyph_index += 1;
        err = FT_Load_Glyph(ft_face, glyph_index, FT_LOAD_RENDER);
        ft_assert(err, "FT_Load_Glyph: %");

        g := ft_face.glyph;
        rects[glyph_index] = get_glyph_rectangle(g, glyph_index);
        bitmap_size := g.bitmap.width * g.bitmap.rows;
        bitmaps[glyph_index] = NewArray(bitmap_size, u8,, allocator = temp);
        memcpy(bitmaps[glyph_index].data, g.bitmap.buffer, bitmap_size * size_of(u8));

        metric := Glyph_Metric.{
            bearing = .{ xx g.bitmap_left, xx g.bitmap_top },
        };
        table_add(*char_map, xx glyph_index, metric);
    }

    packed_successfully := stbrp.pack_rects(*stbrp_ctx, cast(*stbrp.rect, *rects), xx glyph_index);
    assert(packed_successfully == 1, "Some glyphs were not packed.");

    glGenTextures(1, *texture);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, texture);
    defer glBindTexture(GL_TEXTURE_2D, 0);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    defer glPixelStorei(GL_UNPACK_ALIGNMENT, 4);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RED, ATLAS_WIDTH, ATLAS_HEIGHT, 0, GL_RED, GL_UNSIGNED_BYTE, null);
    for 0..glyph_index-1 {
        glyph_rect := rects[it];
        glyph_bitmap := bitmaps[it];
        glTexSubImage2D(
            GL_TEXTURE_2D, 0,
            glyph_rect.x, glyph_rect.y, xx glyph_rect.w, xx glyph_rect.h,
            GL_RED, GL_UNSIGNED_BYTE, glyph_bitmap.data
        );
        _glyph_rect := Rectangle.{
            x = 0,
            y = 0,
            w = cast(float, glyph_rect.w),
            h = cast(float, glyph_rect.h),
        };
        atlas_rect := Rectangle.{
            x = cast(float, glyph_rect.x) / ATLAS_WIDTH,
            y = cast(float, glyph_rect.y) / ATLAS_HEIGHT,
            w = cast(float, glyph_rect.w) / ATLAS_WIDTH,
            h = cast(float, glyph_rect.h) / ATLAS_HEIGHT,
        };
        metric := table_find_pointer(*char_map, xx glyph_rect.id);
        metric.glyph_rect = _glyph_rect;
        metric.atlas_rect = atlas_rect;
    }
}

prepare_text :: (using atlas: *Glyph_Atlas, text: string) -> width: float, height: float {
    cursor: Vector2;
    hb.buffer_reset(hb_buffer);
    hb.buffer_add_utf8(hb_buffer, text.data, xx text.count, 0, -1);
    hb.buffer_guess_segment_properties(hb_buffer);
    hb.shape(hb_font, hb_buffer, null, 0);

    glyph_count: u32;
    glyph_infos     := hb.buffer_get_glyph_infos(atlas.hb_buffer, *glyph_count);
    glyph_positions := hb.buffer_get_glyph_positions(atlas.hb_buffer, *glyph_count);
    height: float;
    for 0..glyph_count-1 {
        glyph_id := glyph_infos[it].codepoint;
        glyph_position := glyph_positions[it];
        metric, success := get_glyph_metric(atlas, glyph_id);

        cursor.x += glyph_position.x_advance >> 6;
        cursor.y += glyph_position.y_advance >> 6;
        height = max(height, metric.glyph_rect.h);
    }
    // Worth considering if we should save more data into `atlas.prepared`.
    prepared.text = text;
    prepared.glyph_count = glyph_count;
    return cursor.x, height;
}

glyph_atlas_destroy :: (using atlas: *Glyph_Atlas) {
    hb.buffer_destroy(hb_buffer);
    hb.font_destroy(hb_font);
    hb.face_destroy(hb_face);
    hb.blob_destroy(hb_blob);
    FT_Done_FreeType(ft);
}

get_glyph_metric :: (using atlas: *Glyph_Atlas, glyph_index: u32) -> metric: Glyph_Metric, success: bool {
    metric, success := table_find(*char_map, glyph_index);
    return metric, success;
}

get_atlas_rectangle :: (using atlas: *Glyph_Atlas) -> Rectangle {
    return .{
        0, 0,
        ATLAS_WIDTH, ATLAS_HEIGHT
    };
}

get_glyph_rectangle :: (g: FT_GlyphSlot, glyph_index: FT_UInt) -> glyph_rect: stbrp.rect {
    glyph_width, glyph_height := g.bitmap.width, g.bitmap.rows;
    glyph_rect: stbrp.rect = .{
        id = xx glyph_index,
        w  = xx glyph_width,
        h  = xx glyph_height
    };

    return glyph_rect;
}

ft_assert :: (err: FT_Error, text: string) {
    error := cast(FT_Err, err);
    assert(error == .Ok, text, error);
}

FONT_DATA :: #run embed("fonts/JetBrainsMono-Regular.ttf");

FONT_SIZE  :: 16;
MAX_GLYPHS :: 2048;
ATLAS_WIDTH, ATLAS_HEIGHT :: 512, 512;
NUM_NODES :: ATLAS_WIDTH;
#assert NUM_NODES >= ATLAS_WIDTH "NUM_NODES must be >= ATLAS_WIDTH for optimal packing.";