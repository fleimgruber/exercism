type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna (strand : dna list) : rna list =
  List.map
    (fun x -> match x with `G -> `C | `C -> `G | `T -> `A | `A -> `U)
    strand
