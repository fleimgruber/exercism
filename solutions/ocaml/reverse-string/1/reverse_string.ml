let rec reverse_string str =
  if (String.length str) < 2 then str else
  let first_char = String.sub str 0 1 in
  let rest = String.sub str 1 ((String.length str) - 1) in
  (reverse_string rest) ^ first_char
