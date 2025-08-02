const std = @import("std");
const math = std.math;

pub fn isArmstrongNumber(num: u128) bool {
    if (num < 10) return true;
    const number_of_digits = math.log10(num) + 1;
    var result: u128 = 0;
    var i: usize = 1;
    while (i <= number_of_digits) : (i += 1) {
        var ith_digit = (num / math.pow(u128, 10, i - 1)) % 10;
        result +|= math.pow(u128, ith_digit, number_of_digits);
    }
    return result == num;
}
