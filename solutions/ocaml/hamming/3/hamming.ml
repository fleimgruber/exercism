open List

type nucleotide = A | C | G | T

let compare distance nucleotide_a nucleotide_b =
  distance + (if nucleotide_a = nucleotide_b then 0 else 1)

let distance strand_a strand_b =
  fold_left2 compare 0 strand_a strand_b

let hamming_distance strand_a strand_b =
  match length strand_a, length strand_b with
  | x, y when x = y -> Ok (distance strand_a strand_b)
  | 0, _ -> Error "left strand must not be empty"
  | _, 0 -> Error "right strand must not be empty"
  | _ -> Error "left and right strands must be of equal length"
