Renderer :: struct {
    width, height: int;
    program: GLuint;
    vao, vbo: GLuint;
    triangles: [MAX_TRIANGLES]Triangle;
    triangle_count := 0;
}

Vertex :: struct {
    #as position: [2]float32;
    color: [4]float32;
}

Triangle :: [3]Vertex;

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
}

push_triangle :: (using r: *Renderer, t: Triangle) {
    triangles[triangle_count] = t;
    triangle_count += 1;
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
}

#scope_file

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

void main()
{
    gl_Position = vec4(a_position, 0.0, 1.0);
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

DEFAULT_CLEAR_COLOR :: float32.[0x18 / 255.0, 0x18 / 255.0, 0x18 / 255.0];
MAX_TRIANGLES :: 1024;

#import "GL";
#import "Window_Creation";