//
// This file was auto-generated using the following command:
//
// jai generate.jai - -compile
//



STB_RECT_PACK_VERSION :: 1;

STBRP__MAXVAL :: 0x7fffffff;

coord :: s32;

// Mostly for internal use, but this is the maximum supported coordinate value.
pack_rects :: (_context: *ctx, rects: *rect, num_rects: s32) -> s32 #foreign stb_rect_pack "stbrp_pack_rects";

// Assign packed locations to rectangles. The rectangles are of type
// 'stbrp_rect' defined below, stored in the array 'rects', and there
// are 'num_rects' many of them.
//
// Rectangles which are successfully packed have the 'was_packed' flag
// set to a non-zero value and 'x' and 'y' store the minimum location
// on each axis (i.e. bottom-left in cartesian coordinates, top-left
// if you imagine y increasing downwards). Rectangles which do not fit
// have the 'was_packed' flag set to 0.
//
// You should not try to access the 'rects' array from another thread
// while this function is running, as the function temporarily reorders
// the array while it executes.
//
// To pack into another rectangle, you need to call stbrp_init_target
// again. To continue packing into the same rectangle, you can call
// this function again. Calling this multiple times with multiple rect
// arrays will probably produce worse packing results than calling it
// a single time with the full rectangle array, but the option is
// available.
//
// The function returns 1 if all of the rectangles were successfully
// packed and 0 otherwise.
rect :: struct {
    // reserved for your use:
    id:         s32;

    // input:
    w:          coord;
    // input:
    h:          coord;

    // output:
    x:          coord;
    // output:
    y:          coord;
    was_packed: s32; // non-zero if valid packing
}

init_target :: (_context: *ctx, width: s32, height: s32, nodes: *node, num_nodes: s32) -> void #foreign stb_rect_pack "stbrp_init_target";

// Initialize a rectangle packer to:
//    pack a rectangle that is 'width' by 'height' in dimensions
//    using temporary storage provided by the array 'nodes', which is 'num_nodes' long
//
// You must call this function every time you start packing into a new target.
//
// There is no "shutdown" function. The 'nodes' memory must stay valid for
// the following stbrp_pack_rects() call (or calls), but can be freed after
// the call (or calls) finish.
//
// Note: to guarantee best results, either:
//       1. make sure 'num_nodes' >= 'width'
//   or  2. call stbrp_allow_out_of_mem() defined below with 'allow_out_of_mem = 1'
//
// If you don't do either of the above things, widths will be quantized to multiples
// of small integers to guarantee the algorithm doesn't run out of temporary storage.
//
// If you do #2, then the non-quantized algorithm will be used, but the algorithm
// may run out of temporary storage and be unable to pack some rectangles.
setup_allow_out_of_mem :: (_context: *ctx, allow_out_of_mem: s32) -> void #foreign stb_rect_pack "stbrp_setup_allow_out_of_mem";

// Optionally call this function after init but before doing any packing to
// change the handling of the out-of-temp-memory scenario, described above.
// If you call init again, this will be reset to the default (false).
setup_heuristic :: (_context: *ctx, heuristic: s32) -> void #foreign stb_rect_pack "stbrp_setup_heuristic";

// Optionally select which packing heuristic the library should use. Different
// heuristics will produce better/worse results for different data sets.
// If you call init again, this will be reset to the default.
STBRP_HEURISTIC_Skyline :: enum s32 {
    default       :: 0;
    BL_sortHeight :: 0;
    BF_sortHeight :: 1;

    STBRP_HEURISTIC_Skyline_default       :: default;
    STBRP_HEURISTIC_Skyline_BL_sortHeight :: BL_sortHeight;
    STBRP_HEURISTIC_Skyline_BF_sortHeight :: BF_sortHeight;
}

//////////////////////////////////////////////////////////////////////////////
//
// the details of the following structures don't matter to you, but they must
// be visible so you can handle the memory allocations for them
node :: struct {
    x:    coord;
    y:    coord;
    next: *node;
}

ctx :: struct {
    width:       s32;
    height:      s32;
    align:       s32;
    init_mode:   s32;
    heuristic:   s32;
    num_nodes:   s32;
    active_head: *node;
    free_head:   *node;
    extra:       [2] node; // we allocate two extra nodes so optimal user-node-count is 'width' not 'width+2'
}

#scope_file

#import "Basic"; // For assert

stb_rect_pack :: #library "windows/stb_rect_pack";

#run {
    {
        instance: rect;
        assert(((cast(*void)(*instance.id)) - cast(*void)(*instance)) == 0, "rect.id has unexpected offset % instead of 0", ((cast(*void)(*instance.id)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.id)) == 4, "rect.id has unexpected size % instead of 4", size_of(type_of(rect.id)));
        assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 4, "rect.w has unexpected offset % instead of 4", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.w)) == 4, "rect.w has unexpected size % instead of 4", size_of(type_of(rect.w)));
        assert(((cast(*void)(*instance.h)) - cast(*void)(*instance)) == 8, "rect.h has unexpected offset % instead of 8", ((cast(*void)(*instance.h)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.h)) == 4, "rect.h has unexpected size % instead of 4", size_of(type_of(rect.h)));
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 12, "rect.x has unexpected offset % instead of 12", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.x)) == 4, "rect.x has unexpected size % instead of 4", size_of(type_of(rect.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 16, "rect.y has unexpected offset % instead of 16", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.y)) == 4, "rect.y has unexpected size % instead of 4", size_of(type_of(rect.y)));
        assert(((cast(*void)(*instance.was_packed)) - cast(*void)(*instance)) == 20, "rect.was_packed has unexpected offset % instead of 20", ((cast(*void)(*instance.was_packed)) - cast(*void)(*instance)));
        assert(size_of(type_of(rect.was_packed)) == 4, "rect.was_packed has unexpected size % instead of 4", size_of(type_of(rect.was_packed)));
        assert(size_of(rect) == 24, "rect has size % instead of 24", size_of(rect));
    }

    {
        instance: node;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "node.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(node.x)) == 4, "node.x has unexpected size % instead of 4", size_of(type_of(node.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "node.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(node.y)) == 4, "node.y has unexpected size % instead of 4", size_of(type_of(node.y)));
        assert(((cast(*void)(*instance.next)) - cast(*void)(*instance)) == 8, "node.next has unexpected offset % instead of 8", ((cast(*void)(*instance.next)) - cast(*void)(*instance)));
        assert(size_of(type_of(node.next)) == 8, "node.next has unexpected size % instead of 8", size_of(type_of(node.next)));
        assert(size_of(node) == 16, "node has size % instead of 16", size_of(node));
    }

    {
        instance: ctx;
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 0, "ctx.width has unexpected offset % instead of 0", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.width)) == 4, "ctx.width has unexpected size % instead of 4", size_of(type_of(ctx.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 4, "ctx.height has unexpected offset % instead of 4", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.height)) == 4, "ctx.height has unexpected size % instead of 4", size_of(type_of(ctx.height)));
        assert(((cast(*void)(*instance.align)) - cast(*void)(*instance)) == 8, "ctx.align has unexpected offset % instead of 8", ((cast(*void)(*instance.align)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.align)) == 4, "ctx.align has unexpected size % instead of 4", size_of(type_of(ctx.align)));
        assert(((cast(*void)(*instance.init_mode)) - cast(*void)(*instance)) == 12, "ctx.init_mode has unexpected offset % instead of 12", ((cast(*void)(*instance.init_mode)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.init_mode)) == 4, "ctx.init_mode has unexpected size % instead of 4", size_of(type_of(ctx.init_mode)));
        assert(((cast(*void)(*instance.heuristic)) - cast(*void)(*instance)) == 16, "ctx.heuristic has unexpected offset % instead of 16", ((cast(*void)(*instance.heuristic)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.heuristic)) == 4, "ctx.heuristic has unexpected size % instead of 4", size_of(type_of(ctx.heuristic)));
        assert(((cast(*void)(*instance.num_nodes)) - cast(*void)(*instance)) == 20, "ctx.num_nodes has unexpected offset % instead of 20", ((cast(*void)(*instance.num_nodes)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.num_nodes)) == 4, "ctx.num_nodes has unexpected size % instead of 4", size_of(type_of(ctx.num_nodes)));
        assert(((cast(*void)(*instance.active_head)) - cast(*void)(*instance)) == 24, "ctx.active_head has unexpected offset % instead of 24", ((cast(*void)(*instance.active_head)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.active_head)) == 8, "ctx.active_head has unexpected size % instead of 8", size_of(type_of(ctx.active_head)));
        assert(((cast(*void)(*instance.free_head)) - cast(*void)(*instance)) == 32, "ctx.free_head has unexpected offset % instead of 32", ((cast(*void)(*instance.free_head)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.free_head)) == 8, "ctx.free_head has unexpected size % instead of 8", size_of(type_of(ctx.free_head)));
        assert(((cast(*void)(*instance.extra)) - cast(*void)(*instance)) == 40, "ctx.extra has unexpected offset % instead of 40", ((cast(*void)(*instance.extra)) - cast(*void)(*instance)));
        assert(size_of(type_of(ctx.extra)) == 32, "ctx.extra has unexpected size % instead of 32", size_of(type_of(ctx.extra)));
        assert(size_of(ctx) == 72, "ctx has size % instead of 72", size_of(ctx));
    }
}

