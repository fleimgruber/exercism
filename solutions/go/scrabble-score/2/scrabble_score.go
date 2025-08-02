// Package scrabble handles related boardgame scoring
package scrabble

import "strings"

type letterSpec struct {
	letters string
	value   int
}

var spec = []letterSpec{
	{"A, E, I, O, U, L, N, R, S, T", 1},
	{"D, G", 2},
	{"B, C, M, P", 3},
	{"F, H, V, W, Y", 4},
	{"K", 5},
	{"J, X", 8},
	{"Q, Z", 10},
}

func buildScores() map[string]int {
	var scores = make(map[string]int)
	for _, score := range spec {
		letters := strings.Split(score.letters, ",")
		for _, letter := range letters {
			trimmedLetter := strings.Trim(letter, " ")
			lowercaseLetter := strings.ToLower(trimmedLetter)
			scores[lowercaseLetter] = score.value
		}
	}
	return scores
}

// Score computes the number a string of letters would score
func Score(letters string) int {
	scores := buildScores()
	var score int
	for _, letter := range letters {
		score += scores[strings.ToLower(string(letter))]
	}
	return score
}
