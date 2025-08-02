function distance(s1::AbstractString, s2::AbstractString)
    length(s1) == length(s2) ||
        throw(ArgumentError("Strands must have the same length"))
    dist = 0
    for (n1, n2) in zip(s1, s2)
        if n1 != n2
            dist += 1
        end
    end
    return dist
end
