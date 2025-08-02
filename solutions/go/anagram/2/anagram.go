// Package anagram looks at strings from all sides.
package anagram

import (
	"reflect"
	"sort"
	"strings"
)

func splitSortLower(s string) []rune {
	s = strings.ToLower(s)
	split := []rune(s)
	sort.Slice(split, func(i, j int) bool {
		return split[i] < split[j]
	})
	return split
}

// Detect finds anagrams of a subject in a list of candidate strings
func Detect(subject string, candidates []string) []string {
	var anagrams []string
	subjectSorted := splitSortLower(subject)
	subjectLower := strings.ToLower(subject)
	for _, candidate := range candidates {
		if subjectLower == strings.ToLower(candidate) {
			continue
		}
		candidateSorted := splitSortLower(candidate)
		if reflect.DeepEqual(subjectSorted, candidateSorted) {
			anagrams = append(anagrams, candidate)
		}
	}
	return anagrams
}
