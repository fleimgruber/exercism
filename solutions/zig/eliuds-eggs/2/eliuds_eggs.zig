pub fn eggCount(number: usize) usize {

    var n = number;
    var acc: usize = 0;

    // shift n one bit to the right so that a new bit is LSB
    while (n != 0): (n >>= 1) {
        // LSB (rightmost bit)
        acc += n & 1;
    }

    return acc;
}
