const std = @import("std");
const parseInt = std.fmt.parseInt;
const print = std.debug.print;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) return false;
    var result: u64 = 0;
    var i: u8 = 1;
    for (s) |c| {
        print("{c}", .{c});
        switch (c) {
            '-' => i = i - 1,
            'X' => result += 10,
            else => result += (11 - i) * (c - '0'),
        }
        i += 1;
    }
    return result % 11 == 0 and i == 10;
}
