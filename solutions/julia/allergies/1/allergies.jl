const allergies_spec = [
    (1, "eggs")
    (2, "peanuts")
    (4, "shellfish")
    (8, "strawberries")
    (16, "tomatoes")
    (32, "chocolate")
    (64, "pollen")
    (128, "cats")
]

const allergies = Dict(allergies_spec)

const _allergies = Dict(a => s for (s, a) in allergies)

function allergic_to(score, allergen)
    k = _allergies[allergen]
    (k & score) == k
end

function allergy_list(score)
    [allergen for (_, allergen) in allergies_spec
     if allergic_to(score, allergen)]
end
