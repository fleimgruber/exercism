function transform(input::AbstractDict)
    dicts = [Dict(lowercase(letter) => score for letter in letters)
             for (score, letters) in input]
    reduce(merge, dicts, init=Dict())
end

