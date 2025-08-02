// Package proverb produces rhyming proverbs
package proverb

import "fmt"

// Proverb creates a proverb out of a rhyme
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}
	rhyme_lines := []string{}
	rhyme_line := "For want of a %s the %s was lost."
	last_line := "And all for the want of a %s."
	if len(rhyme) > 1 {
		for i := 0; i < len(rhyme)-1; i++ {
			current_line := fmt.Sprintf(rhyme_line, rhyme[i], rhyme[i+1])
			rhyme_lines = append(rhyme_lines, current_line)
		}
	}
	last_line = fmt.Sprintf(last_line, rhyme[0])
	rhyme_lines = append(rhyme_lines, last_line)
	return rhyme_lines
}
