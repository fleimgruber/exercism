const std = @import("std");
const ascii = std.ascii;

pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) {
        return false;
    }

    var seen = std.AutoHashMap(usize, void).init(std.testing.allocator);
    defer seen.deinit();
    for (str) |c| {
        var c_lower = ascii.toLower(c);
        if ('a' < c_lower and lower < 'z') {
            if (!seen.contains(c_lower)) {
                seen.put(c_lower, {}) catch unreachable;
            }
        }
    }

    const alphabet: []const u8 = "abcdefghijklmnopqrstuvwxyz";
    for (alphabet) |a| {
        if (!seen.contains(a)) {
            return false;
        }
    }

    return true;
}
