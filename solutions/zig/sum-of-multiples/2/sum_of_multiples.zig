const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    var total: u64 = 0;
    for (1..limit) |i| {
        for (factors) |f| {
            if (!(f > 0)) {
                break;
            }
            if (i % f == 0) {
                total += i;
                break;
            }
        }
    }
    return total;
}
