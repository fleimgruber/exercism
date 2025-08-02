function isisogram(word::AbstractString)
    wordlower = lowercase(word)
    wordalpha = [c for c in collect(wordlower) if isalpha(c)]
    wordset = Set(wordalpha)
    length(wordset) == length(wordalpha)
end
