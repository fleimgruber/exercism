radius(x, y) = sqrt(x^2 + y^2)

function score(x, y)
    r = radius(x, y)
    if r <= 1
        10
    elseif 1 < r <= 5
        5
    elseif 5 < r <= 10
        1
    else
        0
    end
end
