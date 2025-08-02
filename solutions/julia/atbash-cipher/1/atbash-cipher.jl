isrelevant(c) = c in 'a':'z' || c in '0':'9'

function atbash(c)
    if !(c in 'a':'z')
        return c
    end
    return 26 - (c - 'a' + 1) + 'a'
end

function encode(input)
    lowerinput = lowercase(input)
    relevant = filter(c -> isrelevant(c), lowerinput)
    encoded = map(c -> atbash(c), relevant)
    return strip(replace(encoded, r".{5}" => s"\g<0> "))
end

function decode(input)
    decoded = map(c -> atbash(c), input)
    return replace(decoded, r"\s+" => s"")
end
