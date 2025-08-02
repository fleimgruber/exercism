package space

type Planet string
type EarthYear = float64

const EARTH_SECONDS = 31557600

var planets = map[Planet]EarthYear{
	"Mercury": 0.2408467,
	"Venus": 0.61519726,
	"Earth": 1.0,
	"Mars": 1.8808158,
	"Jupiter": 11.862615,
	"Saturn": 29.447498,
	"Uranus": 84.016846,
	"Neptune": 164.79132,
}

// Age computes the age in seconds in another planets time
func Age(seconds float64, planet Planet) float64 {
	return seconds / EARTH_SECONDS / planets[planet]
}
