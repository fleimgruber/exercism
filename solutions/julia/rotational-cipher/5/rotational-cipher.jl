function rotate(by::Int, c::AbstractChar)
    if !(c in 'a':'z' || c in 'A':'Z')
        return c
    end
    if isuppercase(c)
        return mod(c - 'A' + by, 26) + 'A'
    elseif islowercase(c)
        return mod(c - 'a' + by, 26) + 'a'
    end
end

function rotate(by::Int, plaintext::AbstractString)
    map(c -> rotate(by, c), plaintext)
end
