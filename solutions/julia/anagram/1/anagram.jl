function sort_lowercase(word::AbstractString)
    sort(split(lowercase(word), ""))
end

function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
    subjectsorted = sort_lowercase(subject)
    anagrams = [
        candidate for candidate in candidates
        if subjectsorted == sort_lowercase(candidate) &&
        lowercase(candidate) != lowercase(subject)]
    anagrams
end
