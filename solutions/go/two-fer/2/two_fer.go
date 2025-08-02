package twofer

import "fmt"

// ShareWith provides a string with sharing information
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
