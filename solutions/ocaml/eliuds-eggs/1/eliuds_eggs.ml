let rec f number bit_count = match number with
  | number when number <= 0 -> bit_count
  | _ -> f (number asr 1) bit_count + (number land 1)

let egg_count number =
  f number 0
