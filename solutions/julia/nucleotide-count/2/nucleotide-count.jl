const Nucleotides = Set("ACGT")

function count_nucleotides(strand::AbstractString)
    issubset(Set(strand), Nucleotides) ||
        throw(DomainError("only A, C, G and T are valid nucleotides"))
    d = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for c in strand
        d[c] = d[c] + 1
    end
    return d
end
