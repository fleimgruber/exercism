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
)

// KindFromSides determines the kind of triangle it is passed
func KindFromSides(a, b, c float64) Kind {
	switch {
	case a*b*c == math.Inf(1), math.IsNaN(a + b + c), a*b*c <= 0, a+b < c, a+c < b, b+c < a:
		return NaT
	case a == b && b == c:
		return Equ
	case a == b, a == c, b == c:
		return Iso
	default:
		return Sca
	}
}
