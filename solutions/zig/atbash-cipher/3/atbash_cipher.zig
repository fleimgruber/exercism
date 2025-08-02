const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var array = std.ArrayList(u8).init(allocator);
    for (s) |char| {
        if (!std.ascii.isAlphanumeric(char)) continue;
        if (array.items.len % 6 == 5) try array.append(' ');
        if (std.ascii.isDigit(char)) {
            try array.append(char);
            continue;
        }
        var _char = char;
        if (std.ascii.isUpper(char)) {
            _char = std.ascii.toLower(char);
        }
        try array.append('z' + 'a' - _char);
    }
    return array.toOwnedSlice();
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var array = std.ArrayList(u8).init(allocator);
    for (s) |cipher_char| {
        if (cipher_char == ' ') continue;
        if (std.ascii.isDigit(cipher_char)) {
            try array.append(cipher_char);
            continue;
        }
        try array.append('z' + 'a' - cipher_char);
    }
    return array.toOwnedSlice();
}
