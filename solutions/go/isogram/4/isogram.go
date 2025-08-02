// Package isogram contains isogram related functionality.
package isogram

import (
	"strings"
)

// IsIsogram checks if a string is an isogram.
func IsIsogram(candidate string) bool {
	seen := make(map[string]bool)
	var i int
	for _, letter := range letters {
		if letter == "-" || letter == " " {
			continue
		}
		lowerLetter := strings.ToLower(letter)
		if _, ok := seen[lowerLetter]; ok {
			return false
		}
		i++
		seen[lowerLetter] = true
	}
	return i == len(seen)
}
