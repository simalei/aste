Renderer :: struct {
    width, height: int;
    program: GLuint;
    vao, vbo: GLuint;
    triangles: [MAX_TRIANGLES]Triangle;
    triangle_count := 0;
}

Vertex :: struct {
    using #as position: Vector2;
    color: [4]float;
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

    projection := orthographic_projection_matrix(0, cast(float, width), cast(float, height), 0, -1, 1);
    set_gl_uniform(program, "u_projection", projection);
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
    v0: Vertex = .{ .{ rect.x         , rect.y          }, c0 };
    v1: Vertex = .{ .{ rect.x + rect.w, rect.y          }, c1 };
    v2: Vertex = .{ .{ rect.x         , rect.y + rect.h }, c2 };
    v3: Vertex = .{ .{ rect.x + rect.w, rect.y + rect.h }, c3 };
    push_quad(r, v0, v1, v2, v3);
}

push_solid_rectangle :: inline (using r: *Renderer, rect: Rectangle, color: [4]float) {
    v0: Vertex = .{ .{ rect.x         , rect.y          }, color };
    v1: Vertex = .{ .{ rect.x + rect.w, rect.y          }, color };
    v2: Vertex = .{ .{ rect.x         , rect.y + rect.h }, color };
    v3: Vertex = .{ .{ rect.x + rect.w, rect.y + rect.h }, color };
    push_quad(r, v0, v1, v2, v3);
}

renderer_flush :: (using r: *Renderer) {
    glViewport(0, 0, xx width, xx height);
    glClearColor(DEFAULT_CLEAR_COLOR[0], DEFAULT_CLEAR_COLOR[1], DEFAULT_CLEAR_COLOR[2], 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    glBindVertexArray(vao);
    defer glBindVertexArray(0);

    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    defer glBindBuffer(GL_ARRAY_BUFFER, 0);

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

// Copied from the VR example.
offset_of :: ($T: Type, $member: string) -> int {
    for type_info(T).members {
        if it.name == member return it.offset_in_bytes;
    }

    assert(false, "Type '%' does not have member '%'", T, member);
    return -1;
}

// Shaders
VERTEX_SHADER :: #string EOF
#version 330 core

layout (location = 0) in vec2 a_position;
layout (location = 1) in vec4 a_color;

out vec4 v_color;

uniform mat4 u_projection;

void main()
{
    gl_Position = u_projection * vec4(a_position, 0.0, 1.0);
    v_color = a_color;
}
EOF

FRAGMENT_SHADER :: #string EOF
#version 330 core

in vec4 v_color;

out vec4 frag_color;

void main()
{
    frag_color = v_color;
}
EOF

DEFAULT_CLEAR_COLOR :: float.[0x18 / 255.0, 0x18 / 255.0, 0x18 / 255.0];
MAX_TRIANGLES :: 1024;

#import "GL";
#import "Window_Creation";
#import "Math";