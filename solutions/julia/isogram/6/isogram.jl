function isisogram(word::AbstractString)
    letters = [c for c in lowercase(word) if isletter(c)]
    length(Set(letters)) == length(letters)
end
