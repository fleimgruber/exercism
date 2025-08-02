const sqrt = @import("std").math.sqrt;

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return .{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        var radius: f32 = sqrt(self.x * self.x + self.y * self.y);
        return if (radius > 10) 0 else if (radius > 5) 1 else if (radius > 1) 5 else 10;
    }
};
