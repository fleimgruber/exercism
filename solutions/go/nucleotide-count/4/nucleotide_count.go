package dna

import (
	"errors"
	"fmt"
)

// Histogram is a mapping from nucleotide to its count in given DNA.
type Histogram map[rune]int

// DNA is a list of nucleotides.
type DNA []rune

var ns = []rune{'A', 'C', 'G', 'T'}

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	h := make(Histogram)
	for _, n := range ns {
		h[n] = 0
	}
	for _, n := range d {
		_, ok := h[n]
		if !ok {
			return h, errors.New(fmt.Sprintf("nucleotides must be one of %v", ns))
		}
		h[n]++
	}
	return h, nil
}
