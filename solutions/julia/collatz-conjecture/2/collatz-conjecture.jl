function collatz_steps(n)
    n >= 1 || throw(DomainError(n, "argument must be nonnegative"))
    i = 0
    while !isone(n)
        if iseven(n)
            n = div(n, 2)
        else
            n = 3n + 1
        end
        i += 1
    end
    i
end
