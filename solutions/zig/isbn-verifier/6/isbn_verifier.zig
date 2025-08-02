const std = @import("std");
const parseInt = std.fmt.parseInt;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) return false;
    var result: u64 = 0;
    var i: u8 = 0;
    for (s) |c| {
        switch (c) {
            '-' => continue,
            'X' => result += 10,
            '0'...'9' => result += (10 - i) * (c - '0'),
            else => return false,
        }
        i += 1;
    }
    return result % 11 == 0 and i == 10;
}
