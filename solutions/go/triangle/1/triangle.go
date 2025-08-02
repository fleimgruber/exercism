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
	if a == math.Inf(1) || b == math.Inf(1) || c == math.Inf(1) {
		return NaT
	}
	if !(a > 0 && b > 0 && c > 0) {
		return NaT
	}
	if !(a+b >= c && a+c >= b && b+c >= a) {
		return NaT
	}
	if a == b && b == c {
		return Equ
	}
	if a != b && b != c && a != c {
		return Sca
	}
	if a == b || a == c || b == c {
		return Iso
	}
	if isDegenerate(a, b, c) {
		return Deg
	}
	return NaT
}
