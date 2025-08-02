package strand

var transcriber = map[rune]rune{
	'C': 'G',
	'G': 'C',
	'T': 'A',
	'A': 'U',
}

func ToRNA(dna string) string {
	var transcribed = make([]rune, len(dna))
	for i, n := range dna {
		transcribed[i] = transcriber[n]
	}
	return string(transcribed)
}
