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
    // For hb_free.
    decl_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
        if decl.name == "hb_free" {
            decl.output_name = "hb_free";
        }
        return .RECURSE;
    }

    using opts: Generate_Bindings_Options;
    array_add(*source_files, "source/source.h");
    array_add(*libpaths, LIB_DIR);
    array_add(*libnames, "harfbuzz");
    array_add(*strip_prefixes, "hb_");
    visitor = decl_visitor;

    return generate_bindings(opts, "module.jai");
}

compile :: () -> bool {
    source_file := "source/source.cpp";
    make_directory_if_it_does_not_exist(LIB_DIR);

    success := true;
    success &&= build_cpp_dynamic_lib(tprint("%/harfbuzz", LIB_DIR), source_file);
    success &&= build_cpp_static_lib(tprint("%/harfbuzz", LIB_DIR), source_file);
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