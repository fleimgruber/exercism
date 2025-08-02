type nucleotide = A | C | G | T

let hamming_distance strand_a strand_b =
  match (strand_a, strand_b) with
  | [], [] -> Ok 0
  | [], _ -> Error "left strand must not be empty"
  | _, [] -> Error "right strand must not be empty"
  | _ ->
  if List.length strand_a <> List.length strand_b then
    Error "left and right strands must be of equal length"
  else
    let distance =
      List.fold_left2
        (fun acc a b -> if a = b then acc else acc + 1)
        0 strand_a strand_b
    in
    Ok distance
