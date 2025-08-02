function trinary_to_decimal(str)
    isa(tryparse(Float64, str), Number) || return 0
    digits = [parse(Int, c) for c in str]
    all(digits .< 3) || return 0
    sum(digits .* [3^n for n in length(str)-1:-1:0])
end
