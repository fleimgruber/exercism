"""
Predicate to check whether string is a valid Luhn number
"""
function luhn(s::String)
    numberstring = replace(s, r"\s+" => s"")
    length(numberstring) < 2 && return false
    occursin(r"\D", numberstring) && return false
    valid = [parse(Int, c) for c in numberstring]
    for i in length(valid)-1:(-2):1
        doubled = 2 * valid[i]
        valid[i] = doubled > 9 ? doubled - 9 : doubled
    end
    sum(valid) % 10 == 0
end
