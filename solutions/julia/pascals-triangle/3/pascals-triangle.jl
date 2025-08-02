function triangle(n)
    n < 0 && throw(DomainError(n, "argument must be nonnegative"))
    n == 0 && return []
    result = [[1]]
    for i in 2:n
        a = result[end]
        b = [0, a...] + [a..., 0]
        push!(result, b)
    end
    result
end
