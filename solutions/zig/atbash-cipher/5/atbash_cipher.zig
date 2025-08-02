const std = @import("std");
const mem = std.mem;

pub fn cipher(allocator: mem.Allocator, s: []const u8, spaces: bool) ![]u8 {
    var array = std.ArrayList(u8).init(allocator);
    for (s) |c| {
        if (!std.ascii.isAlphanumeric(c)) continue;
        if (spaces and array.items.len % 6 == 5) try array.append(' ');
        if (std.ascii.isDigit(c)) try array.append(c);
        if (std.ascii.isAlphabetic(c)) try array.append('a' + 'z' - std.ascii.toLower(c));
    }
    return array.toOwnedSlice();
}

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    return cipher(allocator, s, true);
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    return cipher(allocator, s, false);
}
