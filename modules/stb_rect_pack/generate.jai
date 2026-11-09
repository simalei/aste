#run {
    set_build_options_dc(.{ do_output = false });
    args := get_build_options().compile_time_command_line;

    success := true;
    if array_find(args, "-compile") {
        success &&= compile();
    }
    success &&= generate();
    assert(success, "Error occurred.");
}

generate :: () -> bool {
    // An exception to the strip prefixes rule.
    // Needed to avoid collision between `_context` the variable and `_context` the struct.
    decl_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
        if decl.name == "stbrp_context" {
            decl.output_name = "ctx";
        }
        return .RECURSE;
    }

    using opts: Generate_Bindings_Options;
    array_add(*source_files, "source/stb_rect_pack.h");
    array_add(*libpaths, LIB_DIR);
    array_add(*libnames, "stb_rect_pack");
    array_add(*strip_prefixes, "stbrp_");
    visitor = decl_visitor;

    return generate_bindings(opts, "module.jai");
}

compile :: () -> bool {
    source_file := "source/stb_rect_pack.c";
    make_directory_if_it_does_not_exist(LIB_DIR);

    success := true;
    success &&= build_cpp_dynamic_lib(tprint("%/stb_rect_pack", LIB_DIR), source_file);
    success &&= build_cpp_static_lib(tprint("%/stb_rect_pack", LIB_DIR), source_file);
    return success;
}

#if OS == {
case .WINDOWS;
    LIB_DIR :: "windows";
case .MACOS;
    LIB_DIR :: "macos";
case .LINUX;
    LIB_DIR :: "linux";
}

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
#import "File";