function sieve(limit)
    limit == 1 && return []
    candidates = collect(2:limit)
    marked = 2
    while marked < limit / 2
        multiples = [marked * i for i in 2:fld(limit, marked)]
        filter!(x -> ~(x in multiples), candidates)
        marked = candidates[candidates .> marked][1]
    end
    return candidates
end
