// Package diffsquares looks squarely at differences.
package diffsquares

// SumOfSquares sums up squares.
func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6
}

// SquareOfSum squares a sum.
func SquareOfSum(n int) int {
	sum := n * (n + 1) / 2
	return sum * sum
}

// Difference looks at differences of squares and squares of differences.
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
