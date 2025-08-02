package isogram

import (
	"strings"
)

// IsIsogram checks if a string is an isogram
func IsIsogram(candidate string) bool {
	seen := make(map[string]bool)
	letters := strings.Split(candidate, "")
	var i int
	for _, letter := range letters {
		if letter != "-" && letter != " " {
			i++
			seen[strings.ToLower(letter)] = true
		}
	}
	return i == len(seen)
}
