const std = @import("std");
const math = std.math;

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        var radius: f32 = math.sqrt(math.pow(f32, self.x, 2) + math.pow(f32, self.y, 2));
        if (radius > 10) return 0;
        if (radius > 5) return 1;
        if (radius > 1) return 5;
        if (radius >= 0) return 10;
        return 0;
    }
};
