function isisogram(word::AbstractString)
    alphabet = join('a':'z')
    wordlower = lowercase(word)
    wordalpha = [c for c in collect(wordlower) if occursin(c, alphabet)]
    wordset = Set(wordalpha)
    length(wordset) == length(wordalpha)
end
