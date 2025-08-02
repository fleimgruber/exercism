/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (1.., s) |i, c| buffer[s.len - i] = c;
    return buffer;
}
