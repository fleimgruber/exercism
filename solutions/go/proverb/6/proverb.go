// Package proverb produces rhyming proverbs
package proverb

import "fmt"

const rhymeLine = "For want of a %s the %s was lost."

// Proverb creates a proverb out of a rhyme
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}
	rhymeLines := []string{}
	lastLine := "And all for the want of a %s."
	for i := 0; i < len(rhyme)-1; i++ {
		currentLine := fmt.Sprintf(rhymeLine, rhyme[i], rhyme[i+1])
		rhymeLines = append(rhymeLines, currentLine)
	}
	lastLine = fmt.Sprintf(lastLine, rhyme[0])
	rhymeLines = append(rhymeLines, lastLine)
	return rhymeLines
}
