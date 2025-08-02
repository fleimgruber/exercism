package raindrops

import "strconv"

func Convert(number int) string {
	drops := ""

	if number % 3 == 0 {
		drops += "Pling"
	}
	if number % 5 == 0 {
		drops += "Plang"
	}
	if number % 7 == 0 {
		drops += "Plong"
	}
	if drops == "" {
		drops += strconv.Itoa(number)
	}
	return drops
}
