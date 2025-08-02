const std = @import("std");
const ascii = std.ascii;

fn wasYelled(s: []const u8) bool {
    var alpha_count: u8 = 0;
    for (s) |c| {
        var alphabetic = ascii.isAlphabetic(c);
        if (alphabetic) alpha_count += 1;
        if (ascii.isAlphabetic(c) and !ascii.isUpper(c)) return false;
    }
    if (alpha_count > 0) return true else return false;
}

fn wasQuestion(s: []const u8) bool {
    const trimmed = std.mem.trim(u8, s, &ascii.whitespace);
    const last_char: u8 = trimmed[trimmed.len - 1];
    if (last_char == '?') return true;
    return false;
}

pub fn response(s: []const u8) []const u8 {
    if (std.mem.trim(u8, s, &ascii.whitespace).len == 0) return "Fine. Be that way!";
    const yelled = wasYelled(s);
    const questioned = wasQuestion(s);
    if (yelled and questioned) return "Calm down, I know what I'm doing!";
    if (questioned) return "Sure.";
    if (yelled) return "Whoa, chill out!";
    return "Whatever.";
}
