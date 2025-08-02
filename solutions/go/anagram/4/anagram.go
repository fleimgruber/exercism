// Package anagram looks at strings from all sides.
package anagram

import (
	"sort"
	"strings"
)

// equal tells whether a and b contain the same elements.
// A nil argument is equivalent to an empty slice.
func equalRunes(a, b []rune) bool {
	if len(a) != len(b) {
		return false
	}
	for i, v := range a {
		if v != b[i] {
			return false
		}
	}
	return true
}

// splitSortLower splits string s into runes and sorts the split.
func splitSortLower(s string) []rune {
	s = strings.ToLower(s)
	split := []rune(s)
	sort.Slice(split, func(i, j int) bool {
		return split[i] < split[j]
	})
	return split
}

// Detect finds anagrams of a subject in a list of candidate strings.
func Detect(subject string, candidates []string) []string {
	var anagrams []string
	subjectSorted := splitSortLower(subject)
	subjectLower := strings.ToLower(subject)
	for _, candidate := range candidates {
		if subjectLower == strings.ToLower(candidate) {
			continue
		}
		candidateSorted := splitSortLower(candidate)
		if equalRunes(subjectSorted, candidateSorted) {
			anagrams = append(anagrams, candidate)
		}
	}
	return anagrams
}
