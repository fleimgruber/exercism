// Package pangram takes a look at every character.
package pangram

import "unicode"

const alphabet = "abcdefghijklmnopqrstuvwxyz"

// IsPangram determines if a string is a proper pangram.
func IsPangram(candidate string) bool {
	seen := make(map[rune]struct{})
	var exists = struct{}{}
	for _, letter := range candidate {
		lowerLetter := unicode.ToLower(letter)
		if 'a' <= lowerLetter && lowerLetter <= 'z' {
			seen[lowerLetter] = exists
		}
	}
	for _, letter := range alphabet {
		if _, ok := seen[letter]; !ok {
			return false
		}
	}
	return true
}
