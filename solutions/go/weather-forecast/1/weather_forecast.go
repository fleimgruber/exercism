// Package weather deals with weather conditions and locations.
package weather

// CurrentCondition is a description of current weather condition.
var CurrentCondition string
// CurrentLocation is a description of current location.
var CurrentLocation string

// Forecast gives the weather forecast for a city based on a location and a condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
