function build_dict(list, value)
    Dict(k => value for k in list)
end

function score(str::AbstractString)
    ones = ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't']
    twos = ['d', 'g']
    threes = ['b', 'c', 'm', 'p']
    fours = ['f', 'h', 'v', 'w', 'y']
    fives = ['k']
    eights = ['j', 'x']
    tens = ['q', 'z']
    d = merge(
        build_dict(ones, 1),
        build_dict(twos, 2),
        build_dict(threes, 3),
        build_dict(fours, 4),
        build_dict(fives, 5),
        build_dict(eights, 8),
        build_dict(tens, 10),
    )
    _score = 0
    for c in str
        c = lowercase(c)
        _score += get(d, c, 0)
    end
    return _score
end
