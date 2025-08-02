pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var a: u32 = 0;
    var c: u32 = 0;
    var g: u32 = 0;
    var t: u32 = 0;
    for (s) |nucleotide| {
        switch (nucleotide) {
            'A' => a += 1,
            'C' => c += 1,
            'G' => g += 1,
            'T' => t += 1,
            else => return NucleotideError.Invalid,
        }
    }
    return Counts{ .a = a, .c = c, .g = g, .t = t };
}
