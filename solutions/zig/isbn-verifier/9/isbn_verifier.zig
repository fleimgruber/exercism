const std = @import("std");
const parseInt = std.fmt.parseInt;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) return false;
    var sum: usize = 0;
    var i: usize = 10;
    for (s) |c| {
        switch (c) {
            '0'...'9' => sum += i * (c - '0'),
            'X' => if (i == 1) {
                sum += 10;
            } else return false,
            '-' => continue,
            else => return false,
        }
        if (i == 0) return false;
        i -= 1;
    }
    return sum % 11 == 0 and i == 0;
}
