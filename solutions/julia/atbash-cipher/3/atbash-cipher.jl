isrelevant(c) = c in 'a':'z' || c in '0':'9'

function atbash(c)
    c in 'a':'z' || return c
    return ('z' - c) + 'a'
end

function encode(input)
    relevant = filter(isrelevant, lowercase(input))
    return join(join.(Iterators.partition(map(atbash, relevant), 5)), " ")
end

function decode(input)
    decoded = map(atbash, input)
    return filter(!isspace, decoded)
end
