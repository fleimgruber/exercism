// Package isogram contains isogram related functionality.
package isogram

import (
	"unicode"
)

// IsIsogram checks if a string is an isogram.
func IsIsogram(candidate string) bool {
	seen := make(map[rune]bool)
	for _, letter := range candidate {
		if letter == '-' || letter == ' ' {
			continue
		}
		lowerLetter := unicode.ToLower(letter)
		if seen[lowerLetter] {
			return false
		}
		seen[lowerLetter] = true
	}
	return true
}
