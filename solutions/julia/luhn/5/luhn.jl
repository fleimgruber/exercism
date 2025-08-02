"""
Predicate to check whether string is a valid Luhn number
"""
function luhn(s::String)
    numberstring = replace(s, r"\s+" => s"")
    length(numberstring) > 1 || return false
    all(isdigit, numberstring) || return false
    digits = [parse(Int, c) for c in numberstring]
    for i in length(digits)-1:(-2):1
        doubled = 2 * digits[i]
        digits[i] = doubled > 9 ? doubled - 9 : doubled
    end
    sum(digits) % 10 == 0
end
