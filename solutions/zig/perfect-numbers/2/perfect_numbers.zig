const std = @import("std");
const debug = std.debug;

pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    debug.assert(n > 0);
    var sum: usize = 0;
    for (1..n) |i| {
        if (@rem(n, i) == 0) sum += i;
    }
    if (sum > n) return Classification.abundant;
    if (sum < n) return Classification.deficient;
    return Classification.perfect;
}
