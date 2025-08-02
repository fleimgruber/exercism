// Package wordcount deals with words and numbers.
package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

// Frequency counts occurrences of words within a string.
func WordCount(s string) Frequency {
	counts := make(map[string]int)
	re := regexp.MustCompile(`[ ,\r\n]+`)
	words := re.Split(s, -1)
	unclean := regexp.MustCompile(`[^a-zA-Z0-9']+`)
	for _, word := range words {
		if word == "" {
			continue
		}
		cleanWord := unclean.ReplaceAllString(word, "")
		cleanWord = strings.Trim(cleanWord, `'`)
		counts[strings.ToLower(cleanWord)] += 1
	}
	return counts
}
