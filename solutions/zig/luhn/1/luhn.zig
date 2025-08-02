pub fn isValid(s: []const u8) bool {
    if (s.len < 2) return false;

    var sum: u64 = 0;
    var i: usize = s.len;
    var digit_count: usize = 0;
    while (i >= 1) : (i -= 1) {
        const c: u8 = s[i - 1];
        var number = switch (c) {
            ' ' => continue,
            '0'...'9' => (c - '0'),
            else => return false,
        };
        digit_count += 1;
        var digit: u8 = if (digit_count % 2 == 0) if (number < 5) 2 * number else 2 * number - 9 else number;
        sum += digit;
    }
    return if (sum % 10 == 0 and digit_count > 1) true else false;
}
