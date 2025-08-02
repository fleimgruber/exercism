// Package isogram contains isogram related functionality.
package isogram

import (
	"unicode"
)

// IsIsogram checks if a string is an isogram.
func IsIsogram(candidate string) bool {
	seen := make(map[rune]bool)
	var i int
	for _, letter := range candidate {
		if letter == '-' || letter == ' ' {
			continue
		}
		lowerLetter := unicode.ToLower(letter)
		if _, ok := seen[lowerLetter]; ok {
			return false
		}
		i++
		seen[lowerLetter] = true
	}
	return i == len(seen)
}
