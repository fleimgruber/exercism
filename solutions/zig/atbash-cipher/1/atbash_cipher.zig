const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var array = std.ArrayList(u8).init(allocator);
    defer array.deinit();
    var i = s.len - s.len;
    for (s) |char| {
        if (char == ' ') continue;
        if (!std.ascii.isAlphanumeric(char)) continue;
        if (i > 0 and i % 5 == 0) {
            try array.append(' ');
        }
        if (std.ascii.isDigit(char)) {
            try array.append(char);
            i += 1;
            continue;
        }
        var _char = char;
        if (std.ascii.isUpper(char)) {
            _char = std.ascii.toLower(char);
        }
        // std.log.warn("\nchar: {}\n", .{char});
        const offset: i16 = ('a' - @as(i16, _char)) + 'a' + 26;
        const cipher_char: u8 = @intCast(offset - 1);
        try array.append(cipher_char);
        i += 1;
    }
    return array.toOwnedSlice();
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var array = std.ArrayList(u8).init(allocator);
    defer array.deinit();
    for (s) |cipher_char| {
        if (cipher_char == ' ') continue;
        if (std.ascii.isDigit(cipher_char)) {
            try array.append(cipher_char);
            continue;
        }
        const offset: i16 = ('a' - @as(i16, cipher_char)) + 'a' + 26;
        const char: u8 = @intCast(offset - 1);
        try array.append(char);
    }
    return array.toOwnedSlice();
}
