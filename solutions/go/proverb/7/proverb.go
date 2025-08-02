// Package proverb produces rhyming proverbs
package proverb

import "fmt"

const rhymeLine = "For want of a %s the %s was lost."
const lastLine = "And all for the want of a %s."

// Proverb creates a proverb out of a rhyme
func Proverb(rhyme []string) []string {
	if len(rhyme) == 0 {
		return []string{}
	}
	rhymeLines := []string{}
	lastLineRhyme := fmt.Sprintf(lastLine, rhyme[0])
	for i := 0; i < len(rhyme)-1; i++ {
		currentLine := fmt.Sprintf(rhymeLine, rhyme[i], rhyme[i+1])
		rhymeLines = append(rhymeLines, currentLine)
	}
	rhymeLines = append(rhymeLines, lastLineRhyme)
	return rhymeLines
}
