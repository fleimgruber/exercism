// Package triangle contains tools for triangles
package triangle

import (
	"math"
)

// Kind is the discerning type of a triangle
type Kind int

// Kinds of triangles are iota'd ints
const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
	Deg        // degenerate
)

func isDegenerate(a, b, c float64) bool {
	return a+b == c || a+c == b || b+c == a
}

// KindFromSides determines the kind of triangle it is passed
func KindFromSides(a, b, c float64) Kind {
	switch {
	case a == math.Inf(1) || b == math.Inf(1) || c == math.Inf(1):
		return NaT
	case !(a > 0 && b > 0 && c > 0):
		return NaT
	case !(a+b >= c && a+c >= b && b+c >= a):
		return NaT
	case a == b && b == c:
		return Equ
	case a != b && b != c && a != c:
		return Sca
	case a == b || a == c || b == c:
		return Iso
	case isDegenerate(a, b, c):
		return Deg
	default:
		return NaT
	}
}
