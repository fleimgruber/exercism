pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    row: i8,
    col: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row < 0 or row > 7 or col < 0 or col > 7) {
            return QueenError.InitializationFailure;
        }
        return .{ .row = row, .col = col };
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        const q1 = self;
        const q2 = other;
        const diagonal: bool = @abs(q1.row - q2.row) == @abs(q1.col - q2.col);
        return q1.row == q2.row or q1.col == q2.col or diagonal;
    }
};
