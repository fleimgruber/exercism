// Package accumulate handles operations on collections.
package accumulate

// Accumulate applies an operation to each element of a collection.
func Accumulate(coll []string, op func(string) string) []string {
	out := make([]string, len(coll))
    for i, elm := range coll {
        out[i] = op(elm)
	}
	return out
}
