pub const ComputationError = error{IllegalArgument};

fn apply_step(number: usize) usize {}

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;

    var number_of_steps: usize = 0;
    var temp = number;

    while (temp != 1) {
        temp = if (number % 2 == 0) number / 2 else 3 * number + 1;
        number_of_steps += 1;
    }
    return number_of_steps;
}
