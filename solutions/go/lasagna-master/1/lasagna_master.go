package lasagna

func PreparationTime(layers []string, n int) int {
	length := len(layers)
	if n == 0 {
		return 2 * length
	} else {
		return n * length
	}
}

func Quantities(layers []string) (int, float64) {
	grams_of_noodles := 50
	liters_of_sauce := 0.2
	total_grams := 0
	total_liters := 0.0
	for _, layer := range layers {
		if layer == "noodles" {
			total_grams += grams_of_noodles
		}
		if layer == "sauce" {
			total_liters += liters_of_sauce
		}
	}
	return total_grams, total_liters
}

func AddSecretIngredient(friendsList []string, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	newQuantities := make([]float64, len(quantities))
	for i, quantity := range quantities {
		newQuantities[i] = quantity * float64(portions)/float64(2)
	}
	return newQuantities
}
