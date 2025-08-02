const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit();

    var splits = std.mem.tokenizeAny(u8, words, ", '-_");
    while (splits.next()) |split|{
        if (split.len == 0) continue;
        try list.append(std.ascii.toUpper(split[0]));
    }
    return try list.toOwnedSlice();
}
