const std = @import("std");
const ascii = std.ascii;

pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) {
        return false;
    }

    var seen = std.AutoHashMap(usize, void).init(std.testing.allocator);
    defer seen.deinit();
    for (str) |c| {
        var int_check: i64 = ascii.toLower(c) - 'a';
        if (int_check < 0 or int_check > 26) {
            continue;
        }
        if (!seen.contains(c)) {
            seen.put(c, {}) catch unreachable;
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
