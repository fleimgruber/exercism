const std = @import("std");
const ascii = std.ascii;

pub fn response(s: []const u8) []const u8 {
    const trimmed = std.mem.trim(u8, s, &ascii.whitespace);

    if (trimmed.len == 0) return "Fine. Be that way!";

    const yelled = wasYelled(trimmed);
    const questioned = wasQuestion(trimmed);

    if (yelled and questioned) return "Calm down, I know what I'm doing!";
    if (questioned) return "Sure.";
    if (yelled) return "Whoa, chill out!";
    return "Whatever.";
}

fn wasYelled(s: []const u8) bool {
    var upper: bool = false;
    for (s) |c| {
        if (ascii.isLower(c)) return false;
        if (ascii.isUpper(c)) upper = true;
    }
    return upper;
}

fn wasQuestion(s: []const u8) bool {
    return s[s.len - 1] == '?';
}
