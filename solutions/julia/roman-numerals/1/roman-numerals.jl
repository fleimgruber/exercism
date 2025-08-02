huns = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

function to_roman(number)
    0 < number <= 3000 ||
        throw(ErrorException("Only numbers greater than zero and lower than 3000 are allowed"))

    res = ""
	  # Add 'M' until we drop below 1000.
    while number >= 1000
        res *= "M"
        number -= 1000
    end

    # Add each of the correct elements, adjusting as we go.
    res *= huns[div(number, 100)+1]
    number = number % 100

    res *= tens[div(number, 10)+1]
    number = number % 10

    res *= ones[number + 1]

    res
end
