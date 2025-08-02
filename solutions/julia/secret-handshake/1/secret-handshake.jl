const events = [
    (1, "wink")
    (2, "double blink")
    (4, "close your eyes")
    (8, "jump")
]

events_list(code) = [event for (bit, event) in events if code & bit > 0]

secret_handshake(code) = code & 16 > 0 ? reverse(events_list(code)) : events_list(code)
