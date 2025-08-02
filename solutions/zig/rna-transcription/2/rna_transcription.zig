const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = std.ArrayList(u8).init(allocator);
    for (dna) |nucleotide| {
        try rna.append(switch (nucleotide) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => unreachable,
        });
    }
    return rna.toOwnedSlice();
}
