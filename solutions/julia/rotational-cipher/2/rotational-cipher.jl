function rotate(by::Int, plaintext::Union{AbstractString, AbstractChar})
    ciphertext = ""
    for c in plaintext
        if isuppercase(c)
            ciphertext *= Char(Int(c + by - 65) % 26 + 65)
        elseif islowercase(c)
            ciphertext *= Char(Int(c + by - 97) % 26 + 97)
        else
            ciphertext *= c
        end
    end
    if length(plaintext) == 1 && typeof(plaintext) == Char
        return ciphertext[1]
    end
    ciphertext
end
