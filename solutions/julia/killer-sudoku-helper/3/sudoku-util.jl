function powerset(x::Vector{T}) where T
    result = Vector{T}[[]]
    for elem in x, j in eachindex(result)
        push!(result, [result[j] ; elem])
    end
    result
end

const all_sets = powerset(collect(1:10))

function combinations_in_cage(cagesum::Int, n_digits::Int)
    sets = (s for s in all_sets if length(s) == n_digits)
    sort!([perm for perm in sets if sum(perm) == cagesum])
end

function combinations_in_cage(cagesum::Int, n_digits::Int, restrictions::Vector)
    sets = combinations_in_cage(cagesum, n_digits)
    filter!(s -> isempty(s ∩ restrictions), sets)
end
