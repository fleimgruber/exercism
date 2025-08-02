const allergies = [
    (1, "eggs")
    (2, "peanuts")
    (4, "shellfish")
    (8, "strawberries")
    (16, "tomatoes")
    (32, "chocolate")
    (64, "pollen")
    (128, "cats")
]

allergy_list(score) = [allergen for (bit, allergen) in allergies if score & bit > 0]
allergic_to(score, allergen) = allergen in allergy_list(score)
