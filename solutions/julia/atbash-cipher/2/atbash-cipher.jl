isrelevant(c) = c in 'a':'z' || c in '0':'9'

function atbash(c)
    if !(c in 'a':'z')
        return c
    end
    return ('z' - c) + 'a'
end

function encode(input)
    lowerinput = lowercase(input)
    relevant = filter(isrelevant, lowerinput)
    encoded = map(atbash, relevant)
    return join([join(chars) for chars in Iterators.partition(encoded, 5)], " ")
end

function decode(input)
    decoded = map(atbash, input)
    return filter(!isspace, decoded)
end
