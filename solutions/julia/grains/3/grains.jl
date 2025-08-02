"""Calculate the number of grains on square `square`."""
function on_square(square)
    0 < square < 65 || throw(DomainError(square, "only squares 0 < x < 64 are defined"))
    return Int128(1) << (square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(n)
    0 < n < 65 || throw(DomainError(n, "only squares 0 < x < 64 are defined"))
    return Int128(2) ^ n - 1
end
