function rotate(by::Int, c::AbstractChar)
    if isuppercase(c)
        return Char(Int(c + by - 65) % 26 + 65)
    elseif islowercase(c)
        return Char(Int(c + by - 97) % 26 + 97)
    else
        return c
    end
end

function rotate(by::Int, plaintext::AbstractString)
    map(c -> rotate(by, c), plaintext)
end
