const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var chars = std.mem.zeroes([26]bool);

    for (str) |v| {
        if (v >= 'a' and v <= 'z') {
            if (chars[v - 'a']) return false;
            chars[v - 'a'] = true;
        }
        if (v >= 'A' and v <= 'Z') {
            if (chars[v - 'A']) return false;
            chars[v - 'A'] = true;
        }
    }
    return true;
}
