function to_roman(number)
    0 < number <= 3000 ||
        error("Only numbers greater than zero and lower than 3000 are allowed")

    huns = ("", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM")
    tens = ("", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC")
    ones = ("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

    res = ""

    multiple, number = divrem(number, 1000)
    res = 'M'^multiple

    multiple, number = divrem(number, 100)
    res *= huns[multiple+1]

    multiple, number = divrem(number, 10)
    res *= tens[multiple+1]

    res *= ones[number + 1]

    res
end
