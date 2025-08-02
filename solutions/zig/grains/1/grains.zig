const std = @import("std");
const math = std.math;

pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    return math.pow(usize, 2, index - 1);
}

pub fn total() u64 {
    return @as(u64, @intCast(math.pow(u128, 2, 64) - 1));
}
