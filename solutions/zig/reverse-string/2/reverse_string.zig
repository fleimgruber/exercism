/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (0..s.len) |i| buffer[i] = s[s.len - 1 - i];
    return buffer;
}
