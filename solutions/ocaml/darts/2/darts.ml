let score (x: float) (y: float): int =
  let r = sqrt (x ** 2.0 +. y ** 2.0) in
  match r with
  | r when r <= 1.0 -> 10
  | r when r <= 5.0 -> 5
  | r when r <= 10.0 -> 1
  | _ -> 0
