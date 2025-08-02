function isisogram(word::AbstractString)
    alphabet = join(string.(Char.("a"[1]:"z"[1])))
    wordlower = lowercase(word)
    wordalpha = [c for c in split(wordlower, "") if occursin(c, alphabet)]
    wordset = Set(wordalpha)
    length(wordset) == length(wordalpha)
end
