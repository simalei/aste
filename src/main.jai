main :: () {
    #if OS == .WINDOWS {
        SetProcessDPIAware();
    }

    WIDTH, HEIGHT :: 800, 600;
    NAME :: "aste";
    window := create_window(WIDTH, HEIGHT, NAME);

    renderer: Renderer;
    renderer_init(*renderer, window);

    quit := false;
    while !quit {
        reset_temporary_storage();
        update_window_events();

        for events_this_frame {
            if it.type == .QUIT then quit = true;
        }

        for resize_event: get_window_resizes() {
            if resize_event.window == window {
                renderer_resize(*renderer, resize_event.width, resize_event.height);
            }
        }

        v0, v1, v2: Vertex;
        v0.position = float32.[ 0, 0 ];
        v0.color = float32.[ 1.0, 1.0, 0.0, 1.0 ];

        v1.position = float32.[ xx renderer.width, xx renderer.height ];
        v1.color = float32.[ 1.0, 0.0, 1.0, 1.0 ];

        v2.position = float32.[ 0, xx renderer.height ];
        v2.color = float32.[ 0.0, 1.0, 1.0, 1.0 ];

        t: Triangle;
        t[0] = v0;
        t[1] = v1;
        t[2] = v2;

        push_triangle(*renderer, t);

        renderer_flush(*renderer);
        swap_buffers(window);
        sleep_milliseconds(16);
    }
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

#load "renderer.jai";
#import "Basic";

#scope_file

#import "Window_Creation";
#import "Input";

#if OS == {
case .WINDOWS;
    #import "Windows";
case .LINUX;
    #import "X11";
}
