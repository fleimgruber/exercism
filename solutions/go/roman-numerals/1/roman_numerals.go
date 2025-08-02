// Package romannumerals converts between representations
package romannumerals

import "errors"

var huns = []string{"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"}
var tens = []string{"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"}
var ones = []string{"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"}

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
