let rec egg_count = function | 0 -> 0 | n -> n land 1 + egg_count (n asr 1)
