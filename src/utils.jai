// Copied from the VR example.
offset_of :: ($T: Type, $member: string) -> int {
    for type_info(T).members {
        if it.name == member return it.offset_in_bytes;
    }

    assert(false, "Type '%' does not have member '%'", T, member);
    return -1;
}

embed :: ($path: string, $T := string) -> T {
    #import "File";
    contents := read_entire_file(path);
    return cast(T, contents);
}

log_codepoint :: (format_string: string, codepoint: u32) {
    #import "Unicode";
    s := character_utf32_to_utf8(codepoint,, allocator = temp);
    log(format_string, s);
} @PrintLike

normalize_color :: inline (color: [3]float) -> [3]float {
    return .[ color[0] / 255.0, color[1] / 255.0, color[2] / 255.0 ];
}

normalize_color :: inline (color: [4]float) -> [4]float {
    return .[ color[0] / 255.0, color[1] / 255.0, color[2] / 255.0, color[3] / 255.0 ];
}