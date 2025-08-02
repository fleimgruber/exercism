pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;

    var number_of_steps: usize = 0;
    var temp = number;

    while (temp != 1) {
        temp = if (temp % 2 == 0) temp / 2 else 3 * temp + 1;
        number_of_steps += 1;
    }
    return number_of_steps;
}
