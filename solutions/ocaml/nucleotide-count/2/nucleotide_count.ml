open Base
open String

let empty = Map.empty (module Char)

let nucleotides = ['A'; 'C'; 'G'; 'T']

let invalid c = not (String.contains (nucleotides |> Base.Sequence.of_list |> String.of_sequence) c)

let count_nucleotide s c =
  if invalid c then Error c
  else match String.find s ~f:invalid with
  | None -> Ok (String.count s ~f:(Char.equal c))
  | Some c -> Error c

let count_nucleotides s =
  String.fold_result s ~init: empty ~f: (fun m c ->
      if invalid c then Error c
      else Ok (Map.update m c ~f: (function | None -> 1 | Some x -> x + 1)))
