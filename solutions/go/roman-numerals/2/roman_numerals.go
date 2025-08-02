// Package romannumerals converts between representations
package romannumerals

import (
	"errors"
	"strings"
)

func bases(pre string, mid string, post string) []string {
	first := strings.Repeat(pre, 1)
	second := strings.Repeat(pre, 2)
	third := strings.Repeat(pre, 3)
	result := []string{
		"",
		first, second, third, first + mid,
		mid,
		mid + first, mid + second, mid + third,
		pre + post,
	}
	return result
}

var huns = bases("C", "D", "M")
var tens = bases("X", "L", "C")
var ones = bases("I", "V", "X")

// ToRomanNumeral converts a number to the roman numeral equivalent
func ToRomanNumeral(number int) (string, error) {
	if number <= 0 || number > 3000 {
		return "", errors.New("number has to be 0 < number < 3001")
	}

	var res string
	//  Add 'M' until we drop below 1000.
	for number >= 1000 {
		res += "M"
		number -= 1000
	}

	// Add each of the correct elements, adjusting as we go.
	res += huns[number/100]
	number = number % 100

	res += tens[number/10]
	number = number % 10

	res += ones[number]

	return res, nil
}
