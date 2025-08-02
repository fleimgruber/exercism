function isisogram(word::AbstractString)
    wordalpha = [c for c in lowercase(word) if isletter(c)]
    length(Set(wordalpha)) == length(wordalpha)
end
