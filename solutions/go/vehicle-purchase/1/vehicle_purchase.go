package purchase

import (
	"fmt"
)

// NeedsLicense determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
func NeedsLicense(kind string) bool {
	if kind == "car" || kind == "truck" {
		return true
	}
	return false
}

// ChooseVehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
func ChooseVehicle(option1, option2 string) string {
	winner := option2
	if option1 < option2 {
		winner = option1
	}
	return fmt.Sprintf("%s is clearly the better choice.", winner)
}

// CalculateResellPrice calculates how much a vehicle can resell for at a certain age.
func CalculateResellPrice(originalPrice, age float64) float64 {
	factor := 1.0
	if age < 3 {
		factor = 0.8
	} else if age >= 10 {
		factor = 0.5
	} else if 3 <= age && age < 10 {
		factor = 0.7
	}
	return originalPrice * factor
}
