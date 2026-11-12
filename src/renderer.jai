Renderer :: struct {
    width, height: int;
    program: GLuint;
    vao, vbo: GLuint;
    triangles: [MAX_TRIANGLES]Triangle;
    triangle_count := 0;
    atlas: Glyph_Atlas;
}

Vertex :: struct {
    using #as position: Vector2;
    color: [4]float;
    uv: Vector2;
}

Triangle :: [3]Vertex;

Rectangle :: struct {
    x, y: float; // Top-left corner.
    w, h: float;
}

renderer_init :: (using r: *Renderer, window: Window_Type) {
    gl_create_context(window);
    gl_load(*gl);
    major, minor := gl_get_version();
    log("Loaded OpenGL %.%", major, minor);

    _, _, width, height = get_dimensions(window, false);
    program = create_program();
    glUseProgram(program);

    glEnable(GL_MULTISAMPLE);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glGenVertexArrays(1, *vao);
    glBindVertexArray(vao);
    defer glBindVertexArray(0);

    glGenBuffers(1, *vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    defer glBindBuffer(GL_ARRAY_BUFFER, 0);

    glBufferData(GL_ARRAY_BUFFER, size_of(Triangle) * MAX_TRIANGLES, null, GL_DYNAMIC_DRAW);

    glVertexAttribPointer(0, 2, GL_FLOAT, false, size_of(Vertex), cast(*void) offset_of(Vertex, "position"));
    glEnableVertexAttribArray(0);

    glVertexAttribPointer(1, 4, GL_FLOAT, false, size_of(Vertex), cast(*void) offset_of(Vertex, "color"));
    glEnableVertexAttribArray(1);

    glVertexAttribPointer(2, 2, GL_FLOAT, false, size_of(Vertex), cast(*void) offset_of(Vertex, "uv"));
    glEnableVertexAttribArray(2);

    projection := orthographic_projection_matrix(0, cast(float, width), cast(float, height), 0, -1, 1);
    set_gl_uniform(program, "u_projection", projection);

    glyph_atlas_init(*r.atlas);
}

push_triangle :: inline (using r: *Renderer, ts: ..Triangle) {
    for t: ts {
        triangles[triangle_count] = t;
        triangle_count += 1;
    }
}

/*
    0---1
    | \ |
    2---3
*/
push_quad :: inline (using r: *Renderer, v0: Vertex, v1: Vertex, v2: Vertex, v3: Vertex) {
    t1: Triangle = .[ v0, v2, v3 ];
    t2: Triangle = .[ v0, v1, v3 ];
    push_triangle(r, t1, t2);
}

push_rectangle :: inline (using r: *Renderer, rect: Rectangle, c0: [4]float, c1: [4]float, c2: [4]float, c3: [4]float) {
    uv: Vector2 = .{ 0, 0 };
    v0: Vertex = .{ .{ rect.x         , rect.y          }, c0, uv };
    v1: Vertex = .{ .{ rect.x + rect.w, rect.y          }, c1, uv };
    v2: Vertex = .{ .{ rect.x         , rect.y + rect.h }, c2, uv };
    v3: Vertex = .{ .{ rect.x + rect.w, rect.y + rect.h }, c3, uv };
    push_quad(r, v0, v1, v2, v3);
}

push_solid_rectangle :: inline (using r: *Renderer, rect: Rectangle, color: [4]float) {
    uv: Vector2 = .{ 0, 0 };
    v0: Vertex = .{ .{ rect.x         , rect.y          }, color, uv };
    v1: Vertex = .{ .{ rect.x + rect.w, rect.y          }, color, uv };
    v2: Vertex = .{ .{ rect.x         , rect.y + rect.h }, color, uv };
    v3: Vertex = .{ .{ rect.x + rect.w, rect.y + rect.h }, color, uv };
    push_quad(r, v0, v1, v2, v3);
}

push_textured_rectangle :: (using r: *Renderer, rect: Rectangle, uv_rect: Rectangle, tint: [3]float = .[ 1.0, 1.0, 1.0 ]) {
    c: [4]float = .[ tint[0], tint[1], tint[2], 1.0 ];
    v0: Vertex = .{ .{ rect.x         , rect.y          }, c, .{ uv_rect.x            , uv_rect.y             } };
    v1: Vertex = .{ .{ rect.x + rect.w, rect.y          }, c, .{ uv_rect.x + uv_rect.w, uv_rect.y             } };
    v2: Vertex = .{ .{ rect.x         , rect.y + rect.h }, c, .{ uv_rect.x            , uv_rect.y + uv_rect.h } };
    v3: Vertex = .{ .{ rect.x + rect.w, rect.y + rect.h }, c, .{ uv_rect.x + uv_rect.w, uv_rect.y + uv_rect.h } };
    push_quad(r, v0, v1, v2, v3);
}

push_text :: (using r: *Renderer, origin: Vector2, text: string, tint: [3]float = .[ 1.0, 1.0, 1.0 ]) {
    cursor := origin;
    glyph_count: u32;
    if text != atlas.prepared.text {
        hb.buffer_reset(atlas.hb_buffer);
        hb.buffer_add_utf8(atlas.hb_buffer, text.data, xx text.count, 0, -1);
        hb.buffer_guess_segment_properties(atlas.hb_buffer);
        hb.shape(atlas.hb_font, atlas.hb_buffer, null, 0);
        atlas.prepared.text = text;
    } else {
        // Avoid reshaping if the text was "prepared" (measured) before.
        assert(hb.buffer_get_content_type(atlas.hb_buffer) == .GLYPHS);
        glyph_count = atlas.prepared.glyph_count;
    }
    glyph_infos     := hb.buffer_get_glyph_infos(atlas.hb_buffer, *glyph_count);
    glyph_positions := hb.buffer_get_glyph_positions(atlas.hb_buffer, *glyph_count);
    if text != atlas.prepared.text {
        atlas.prepared.glyph_count = glyph_count;
    }
    for 0..glyph_count-1 {
        glyph_id := glyph_infos[it].codepoint;
        glyph_position := glyph_positions[it];
        metric, success := get_glyph_metric(*atlas, glyph_id);
        if !success {
            log_error("Failed to find metric for glyph index %.", glyph_id);
        }

        // Questionable calculations here.
        target_rect := Rectangle.{
            // @Bad Flooring seems to fix the artifact problem but idk.
            x = floor( metric.bearing.x + cursor.x + glyph_position.x_offset),
            y = floor(-metric.bearing.y + cursor.y - glyph_position.y_offset),
            w = metric.glyph_rect.w,
            h = metric.glyph_rect.h,
        };

        push_textured_rectangle(r, target_rect, metric.atlas_rect, tint);
        cursor.x += glyph_position.x_advance >> 6;
        cursor.y += glyph_position.y_advance >> 6;
    }
}

renderer_flush :: (using r: *Renderer) {
    glViewport(0, 0, xx width, xx height);
    glClearColor(DEFAULT_CLEAR_COLOR[0], DEFAULT_CLEAR_COLOR[1], DEFAULT_CLEAR_COLOR[2], 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    glBindVertexArray(vao);
    defer glBindVertexArray(0);

    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    defer glBindBuffer(GL_ARRAY_BUFFER, 0);

    glBindTexture(GL_TEXTURE_2D, atlas.texture);
    defer glBindTexture(GL_TEXTURE_2D, 0);

    glBufferSubData(GL_ARRAY_BUFFER, 0, size_of(Triangle) * triangles.count, triangles.data);
    glDrawArrays(GL_TRIANGLES, 0, xx (3 * triangles.count));

    triangle_count = 0;
}

renderer_resize :: (using r: *Renderer, new_width: int, new_height: int) {
    width = new_width;
    height = new_height;

    projection := orthographic_projection_matrix(0, cast(float, width), cast(float, height), 0, -1, 1);
    set_gl_uniform(program, "u_projection", projection);
}

renderer_destroy :: (using r: *Renderer) {
    glyph_atlas_destroy(*atlas);
}

swap_buffers :: (window: Window_Type) {
    #if OS == {
    case .WINDOWS;
        dc := GetDC(window);
        SwapBuffers(dc);
    case .LINUX;
        // Untested
        glXSwapBuffers(x_global_display, window);
    }
}

#scope_file

set_gl_uniform :: (program: GLuint, $name: string, value: Matrix4, transpose := true) {
    location := _glGetUniformLocation(program, name);
    glUniformMatrix4fv(location, 1, transpose, *value._11);
}

create_program :: () -> program: GLuint {
    vs := glCreateShader(GL_VERTEX_SHADER);
    _glShaderSource(vs, VERTEX_SHADER);
    glCompileShader(vs);
    DumpShaderInfoLog(vs, "VERTEX");
    defer glDeleteShader(vs);

    fs := glCreateShader(GL_FRAGMENT_SHADER);
    _glShaderSource(fs, FRAGMENT_SHADER);
    glCompileShader(fs);
    DumpShaderInfoLog(fs, "FRAGMENT");
    defer glDeleteShader(fs);

    program := glCreateProgram();
    glAttachShader(program, vs);
    glAttachShader(program, fs);
    glLinkProgram(program);

    return program;
}

// Shaders
VERTEX_SHADER :: #string EOF
#version 330 core

layout (location = 0) in vec2 a_position;
layout (location = 1) in vec4 a_color;
layout (location = 2) in vec2 a_uv;

out vec4 v_color;
out vec2 v_uv;

uniform mat4 u_projection;

void main()
{
    gl_Position = u_projection * vec4(a_position, 0.0, 1.0);
    v_color = a_color;
    v_uv = a_uv;
}
EOF

FRAGMENT_SHADER :: #string EOF
#version 330 core

in vec4 v_color;
in vec2 v_uv;

out vec4 frag_color;

uniform sampler2D u_glyph_atlas;

void main()
{
    //frag_color = v_color;
    frag_color = vec4(v_color.rgb, texture(u_glyph_atlas, v_uv).r);
}
EOF

DEFAULT_CLEAR_COLOR :: float.[0x18 / 255.0, 0x18 / 255.0, 0x18 / 255.0];
MAX_TRIANGLES :: 1024;

#import "GL";
#import "Window_Creation";
hb :: #import "HarfBuzz";