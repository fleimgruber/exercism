function wordcount(sentence::AbstractString)
    alphanum = r"[a-zA-Z0-9]"
    notalphanum = r"[^a-zA-Z0-9']"
    if !occursin(alphanum, sentence)
        return Dict()
    end
    d = Dict()
    words = split(sentence, r"[ ,\r\n]+")
    for word in words
        word = replace(word, notalphanum => "")
        word = lowercase(word)
        word = strip(word, ['''])
        d[word] = get(d, word, 0) + 1
    end
    d
end
