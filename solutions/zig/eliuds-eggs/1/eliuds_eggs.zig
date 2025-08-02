pub fn eggCount(number: usize) usize {
    var accumulator: u64 = 0;

    var bits: u64 = number;

    while (bits != 0) {
        // LSB (rightmost bit)
        accumulator += bits & 1;
        // shift one bit to the right so that a new bit is LSB
        bits >>= 1;
    }

    return accumulator;
}
