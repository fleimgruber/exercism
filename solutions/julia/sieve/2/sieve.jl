function sieve(limit)
    limit == 1 && return []
    candidates = Vector{Int}(2:limit)
    marked = 2
    while marked < limit / 2
        multiples = marked .* (2:fld(limit, marked))
        filter!(!in(multiples), candidates)
        for candidate in candidates
            if candidate > marked
                marked = candidate
                break
            end
        end
    end
    return candidates
end
