// Package encode encodes various data structures.
package encode

import (
	"strconv"
	"strings"
	"unicode"
)

// RunLengthEncode implements run-length encoding for strings.
func RunLengthEncode(s string) string {
	n := len(s)
	var encoded string
	for i := 0; i < n; i++ {
		count := 1
		for i < n-1 && s[i] == s[i+1] {
			count++
			i++
		}
		var nSeen string
		if count == 1 {
			encoded = encoded + string(s[i])
		} else {
			nSeen = strconv.Itoa(count)
			encoded = encoded + nSeen + string(s[i])
		}
	}
	return encoded
}

// RunLengthEncode implements run-length decoding for strings.
func RunLengthDecode(s string) string {
	var decoded string
	var count string
	for _, r := range s {
		if unicode.IsDigit(r) {
			count += string(r)
		} else {
			if count == "" {
				decoded += string(r)
			} else {
				n, _ := strconv.ParseInt(count, 10, 0)
				decoded += strings.Repeat(string(r), int(n))
			}
			count = ""
		}
	}
	return decoded
}
