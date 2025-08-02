function isvalid(c::Char)
     48 <= Int(c) < 58 || false
end

function over(x::Int)
    doubled = 2 * x
    if doubled > 9
        doubled -= 9
    end
    doubled
end

"""
Predicate to check whether string is a valid Luhn number
"""
function luhn(s::String)
    numberstring = replace(s, r"\s+" => s"")
    length(numberstring) < 2 && return false
    all(isvalid(c) for c in numberstring) || return false
    valid = [parse(Int, c) for c in numberstring]
    for i in length(valid)-1:(-2):1
        valid[i] = over(valid[i])
    end
    s = sum(valid)
    s % 10 == 0 || false
end
