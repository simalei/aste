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

        rect: Rectangle;
        rect.x = 100;
        rect.y = 100;
        rect.w = 200;
        rect.h = 300;

        push_rectangle(*renderer, rect, .[ 1.0, 0.0, 0.0, 1.0 ], .[ 0.0, 1.0, 0.0, 1.0 ], .[ 0.0, 0.0, 1.0, 1.0 ], .[ 1.0, 1.0, 1.0, 1.0 ]);

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
