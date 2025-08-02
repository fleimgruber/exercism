// Package protein deals with nucleotide sequences and proteins.
package protein

type ErrStop struct {}

func (e ErrStop) Error() string { return "saw 'STOP' marker"}

type ErrInvalidBase struct {}

func (e ErrInvalidBase) Error() string { return "saw an invalid base"}

var codons = map[string]string{
	"AUG": "Methionine",
	"UUU": "Phenylalanine", "UUC": "Phenylalanine",
	"UUA": "Leucine", "UUG": "Leucine",
	"UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
	"UAU": "Tyrosine", "UAC": "Tyrosine",
	"UGU": "Cysteine", "UGC": "Cysteine",
	"UGG": "Tryptophan",
	"UAA": "STOP", "UAG": "STOP", "UGA": "STOP",
}

func FromCodon(codon string) (string, error) {
    protein, ok := codons[codon]
	if !ok {
		return "", ErrInvalidBase{}
	}
	if protein == "STOP" {
		return "", ErrStop{}
	}
	return protein, nil
}

func FromRNA(rna string) ([]string, error) {
	var out = []string{}
	for i := 0; i < len(rna) / 3; i++ {
		codon := rna[i:i+3]
        protein, _ := codons[codon]
		if protein == "STOP" {
			return out, ErrStop{}
		}
		out = append(out, protein)
	}
	return out, nil
}
