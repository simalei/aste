main :: () {
    #if OS == .WINDOWS {
        SetProcessDPIAware();
    }

    log("Current working directory: %", get_working_directory());

    WIDTH, HEIGHT :: 800, 600;
    NAME :: "aste";
    window := create_window(WIDTH, HEIGHT, NAME);

    renderer: Renderer;
    renderer_init(*renderer, window);
    defer renderer_destroy(*renderer);

    swap_interval(1);
    quit := false;

    while !quit {
        reset_temporary_storage();
        update_window_events();

        for events_this_frame {
            if it.type == {
            case .QUIT;
                quit = true;
            case .KEYBOARD;
                if it.key_pressed && it.key_code == .ESCAPE {
                    quit = true;
                }
            }
        }

        for resize_event: get_window_resizes() {
            if resize_event.window == window {
                renderer_resize(*renderer, resize_event.width, resize_event.height);
            }
        }

        TEXT :: "main :: () -> string { return \"Привет!\"; }";
        text_width, text_height := prepare_text(*renderer.atlas, TEXT);
        push_text(*renderer, .{ 200, 200 }, TEXT);
        ascender := renderer.atlas.ascender;
        descender := renderer.atlas.descender;
        push_solid_rectangle(*renderer, .{ 200, 200.0 - ascender, text_width, cast(float, ascender - descender) }, .[ 1.0, 1.0, 1.0, 0.2 ]);

        renderer_flush(*renderer);
        swap_buffers(window);
    }
}

#load "renderer.jai";
#load "glyph_atlas.jai";
#load "utils.jai";

#import "Basic";
#import "Math";
#import "GL";
#import "Window_Creation";
#import "Input";
#import "File";
#import "Hash_Table";
#import "Unicode";
#import "freetype-2.12.1";
stbrp :: #import "stb_rect_pack";
hb    :: #import "HarfBuzz";
#if OS == {
case .WINDOWS;
    #import "Windows";
case .LINUX;
    #import "X11";
}