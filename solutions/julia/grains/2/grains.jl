"""Calculate the number of grains on square `square`."""
function on_square(square)
    0 < square < 65 || throw(DomainError(square, "only squares 0 < x < 64 are defined"))
    return big(1) << (big(square) - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    0 < square < 65 || throw(DomainError(square, "only squares 0 < x < 64 are defined"))
    return sum(on_square(i) for i = 1:big(square))
end
