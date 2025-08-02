const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var map = std.AutoHashMap(u32, void).init(allocator);
    defer map.deinit();

    for (factors) |f| {
        if (f == 0) {
            break;
        }
        var i = f;
        while (i < limit) {
            try map.put(i, {});
            i += f;
        }
    }

    var total: u64 = 0;
    var multiples = map.keyIterator();
    while (multiples.next()) |key| {
        total += key.*;
    }
    return total;
}
