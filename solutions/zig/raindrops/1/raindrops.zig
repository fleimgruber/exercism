const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var i: usize = 0;

    if (n % 3 == 0) {
        std.mem.copyForwards(u8, buffer[i..], "Pling");
        i += "Pling".len;
    }
    if (n % 5 == 0) {
        std.mem.copyForwards(u8, buffer[i..], "Plang");
        i += "Plang".len;
    }
    if (n % 7 == 0) {
        std.mem.copyForwards(u8, buffer[i..], "Plong");
        i += "Plong".len;
    }

    const result = buffer[0..i];
    if (std.mem.eql(u8, "", result)){
        const written = std.fmt.formatIntBuf(buffer[i..], n, 10, .lower, .{});
        return buffer[0..written];
    } else {
        return result;
    }
}
