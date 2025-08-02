const Nucleotides = Set("ACGT")
const Complements = Dict(
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
)

function to_rna(dna::AbstractString)
    issubset(Set(dna), Nucleotides) ||
        throw(ErrorException("only A, C, G and T are valid nucleotides"))
    map(n -> Complements[n], dna)
end
