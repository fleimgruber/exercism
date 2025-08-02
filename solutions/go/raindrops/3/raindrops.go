// Package raindrops converts rain to sounds
package raindrops

import (
	"strconv"
)

// Convert produces a string of sounds a number would make.
func Convert(number int) string {
	var drops string

	if number%3 == 0 {
		drops += "Pling"
	}
	if number%5 == 0 {
		drops += "Plang"
	}
	if number%7 == 0 {
		drops += "Plong"
	}
	if drops == "" {
		return strconv.Itoa(number)
	}

	return drops
}
