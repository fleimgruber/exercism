pub const DnaError = error{
    UnequalDnaStrands,
    EmptyDnaStrands,
};

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }
    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }
    var result: usize = 0;
    for (first, second) |first_nucleotide, second_nucleotide| {
        if (first_nucleotide != second_nucleotide) result += 1;
    }
    return result;
}
