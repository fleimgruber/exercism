"Square the sum of the first `n` positive integers"
square_of_sum(n) = div(n*(n+1), 2)^2

"Sum the squares of the first `n` positive integers"
sum_of_squares(n) = div(n*(n+1)*(2n+1), 6)

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
difference(n) = square_of_sum(n) - sum_of_squares(n)
