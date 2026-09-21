let rec pow base n =
  if n = 0 then 1
  else if n mod 2 = 0 then pow (base * base) (n / 2)
  else base * pow (base * base) (n / 2)

let validate candidate =
  let s = string_of_int candidate in
  let len = String.length s in
  let armstrong = String.fold_left (fun acc c ->
      let d = Char.code c - Char.code '0' in
      acc + pow d len) 0 s
  in
  armstrong = candidate
