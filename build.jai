#run build();

build :: () {
    set_build_options_dc(.{ do_output = false });
    w := compiler_create_workspace("Target Program");
    if !w {
        print("Workspace creation failed.\n");
        return;
    }

    using opts := get_build_options(w);
    output_path = "out";
    make_directory_if_it_does_not_exist(output_path);
    intermediate_path = "out/.build";
    output_executable_name = "aste";
    set_build_options(opts, w);

    args := opts.compile_time_command_line;
    should_run := array_find(args, "run");

    compiler_begin_intercept(w);
    add_build_file("src/main.jai", w);
    while true {
        message := compiler_wait_for_message();
        if message.kind == {
        case .COMPLETE;
            complete := cast(*Message_Complete, message);
            should_run = should_run && complete.error_code == .NONE;
            break;
        }
    }
    compiler_end_intercept(w);
    if should_run {
        run_command("out/aste", working_directory = output_path);
    }
}

#import "Basic";
#import "Compiler";
#import "File";
#import "Process";