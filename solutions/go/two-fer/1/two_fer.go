package twofer

import "fmt"

func ShareWith(name string) string {
	var with = "you"
	if name != "" {
		with = name
	}
	return fmt.Sprintf("One for %s, one for me.", with)
}
