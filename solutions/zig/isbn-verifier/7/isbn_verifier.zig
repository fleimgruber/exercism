const std = @import("std");
const parseInt = std.fmt.parseInt;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) return false;
    var result: usize = 0;
    var i: usize = 10;
    for (s) |c| {
        switch (c) {
            '-' => continue,
            'X' => if (i == 1) {
                result += 10;
            } else return false,
            '0'...'9' => result += i * (c - '0'),
            else => return false,
        }
        i -= 1;
    }
    return result % 11 == 0 and i == 0;
}
