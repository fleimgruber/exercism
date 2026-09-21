let two_fer x =
  match x with
  | None -> "One for you, one for me."
  | Some v -> Printf.sprintf "One for %s, one for me."  v
