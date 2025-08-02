package strain

type Ints []int
type Lists [][]int
type Strings []string

func (ints Ints) Keep(pred func(int) bool) Ints {
	var keep Ints
	for _, integer := range ints {
		if pred(integer) {
			keep = append(keep, integer)
		}
	}
	return keep
}

func (ints Ints) Discard(pred func(int) bool) Ints {
	return ints.Keep(func(x int) bool { return !pred(x) })
}

func (lists Lists) Keep(pred func([]int) bool) Lists {
	var keep Lists
	for _, sublist := range lists {
		if pred(sublist) {
			keep = append(keep, sublist)
		}
	}
	return keep
}

func (strings Strings) Keep(pred func(string) bool) Strings {
	var keep Strings
	for _, s := range strings {
		if pred(s) {
			keep = append(keep, s)
		}
	}
	return keep
}
