function rotate(by::Int, plaintext::Union{AbstractString, AbstractChar})
    alphabet = join(string.(Char.("a"[1]:"z"[1])))
    alphabetplain = Dict(c => n for (c, n) in zip(alphabet, 0:25))
    alphabetcipher = Dict(n => c for (c, n) in alphabetplain)
    ciphertext = ""
    for c in plaintext
        plainchar = lowercase(c)
        if occursin(plainchar, alphabet)
            plainnumber = alphabetplain[plainchar]
            ciphernumber = (plainnumber + by) % 26
            cipherchar = alphabetcipher[ciphernumber]
            if isuppercase(c)
                cipherchar = uppercase(cipherchar)
            end
        else
            cipherchar = plainchar
        end
        ciphertext *= cipherchar
    end
    if length(plaintext) == 1 && typeof(plaintext) == Char
        return ciphertext[1]
    end
    ciphertext
end
