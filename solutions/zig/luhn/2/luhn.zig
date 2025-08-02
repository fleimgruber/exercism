pub fn isValid(s: []const u8) bool {
    var sum: u8 = 0;
    var i: usize = s.len;
    var digit_count: usize = 0;
    while (i >= 1) : (i -= 1) {
        const c: u8 = s[i - 1];
        var digit = switch (c) {
            ' ' => continue,
            '0'...'9' => (c - '0'),
            else => return false,
        };
        digit_count += 1;
        var number = if (digit_count % 2 == 0) 2 * digit else digit;
        sum = (sum + if (number > 9) number - 9 else number) % 10;
    }
    return sum == 0 and digit_count > 1;
}
