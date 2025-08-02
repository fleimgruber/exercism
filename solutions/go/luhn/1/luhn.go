// Package luhn provides Luhn checksums checks.
package luhn

import (
	"strconv"
	"strings"
	"unicode"
)

// Valid checks whether a given number is valid according to Luhn.
func Valid(s string) bool {
	numberString := strings.Replace(s, " ", "", -1)
	numbers := []rune(numberString)

	if len(numbers) < 2 {
		return false
	}

	valid := make([]int, len(numbers))
	for i, r := range numbers {
		if !(unicode.IsDigit(r) || r == ' ') {
			return false
		}
		valid[i], _ = strconv.Atoi(string(r))
	}

	for i := len(valid) - 2; i >= 0; i -= 2 {
		doubled := 2 * valid[i]
		if doubled > 9 {
			doubled -= 9
		}
		valid[i] = doubled
	}

	sum := 0
	for _, i := range valid {
		sum += i
	}

	check := sum % 10
	if check == 0 {
		return true
	}

	return false
}
