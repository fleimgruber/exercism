pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const years = [8]f16{
            0.2408467,
            0.61519726,
            1.0,
            1.8808158,
            11.862615,
            29.447498,
            84.016846,
            164.79132,
        };
        const earth_seconds = 31557600;
        return @as(f64, @floatFromInt(seconds)) / earth_seconds / years[@intFromEnum(self)];
    }
};
