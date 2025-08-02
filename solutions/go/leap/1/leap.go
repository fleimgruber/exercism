// Package leap provides utilities for leap years
package leap

// IsLeapYear tests whether a year is a leap year
func IsLeapYear(x int) bool {
	return x % 4 == 0 && x % 100 != 0 || x % 400 == 0
}
