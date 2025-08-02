// Package protein deals with nucleotide sequences and proteins.
package protein

import "errors"

var (
	ErrStop        error = errors.New("saw 'STOP' marker")
	ErrInvalidBase error = errors.New("saw an invalid base")
)

// FromCodon converts a codon into a protein.
func FromCodon(codon string) (string, error) {
	switch codon {
	case "AUG":
		return "Methionine", nil
	case "UUU", "UUC":
		return "Phenylalanine", nil
	case "UUA", "UUG":
		return "Leucine", nil
	case "UCU", "UCC", "UCA", "UCG":
		return "Serine", nil
	case "UAU", "UAC":
		return "Tyrosine", nil
	case "UGU", "UGC":
		return "Cysteine", nil
	case "UGG":
		return "Tryptophan", nil
	case "UAA", "UAG", "UGA":
		return "", ErrStop
	default:
		return "", ErrInvalidBase
	}
}

// FromRNA translates an RNA to a protein sequence.
func FromRNA(rna string) ([]string, error) {
	out := make([]string, 0, len(rna)/3)
	for i := 0; i < len(rna); i += 3 {
		codon := rna[i : i+3]
		protein, err := FromCodon(codon)
		if err == ErrStop {
			return out, nil
		}
		if err != nil {
			return out, err
		}
		out = append(out, protein)
	}
	return out, nil
}
