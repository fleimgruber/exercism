function ispangram(input::AbstractString)
    alphabet = Set("abcdefghijklmnopqrstuvwxyz")
    issubset(alphabet, Set(lowercase(input)))
end

