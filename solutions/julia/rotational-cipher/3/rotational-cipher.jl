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
    ciphertext = ""
    for c in plaintext
        ciphertext *= rotate(by, c)
    end
    ciphertext
end
