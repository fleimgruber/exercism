// Package gigasecond deals with a big amount of seconds.
package gigasecond

import "time"

const gigasecond = 1e9

// AddGigasecond adds a giga second to a given time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * gigasecond)
}
