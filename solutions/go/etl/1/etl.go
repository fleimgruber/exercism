// Package etl deals with transformation of legacy data.
package etl

import "strings"

// Transform converts from int -> letters to letter -> int.
func Transform(mapping map[int][]string) map[string]int {
	out := make(map[string]int)
	for i, letters := range mapping {
		for _, letter := range letters {
			out[strings.ToLower(letter)] = i
		}
	}
	return out
}
