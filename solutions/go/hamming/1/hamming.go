// Package hamming provides Hamming distance checks
package hamming

import "errors"

// Distance calculates the Hamming distance between two DNA strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 1, errors.New("Both strands must have the same length")
	}
	distance := 0
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			distance++
		}
	}
	return distance, nil
}
