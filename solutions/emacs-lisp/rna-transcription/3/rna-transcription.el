;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(defconst rna-transcription--rule '(("A" . "U") ("C" . "G") ("G" . "C") ("T" . "A")))

(defun to-rna (dna-strand)
  "Transcribe DNA-STRAND using RNA transcription"
  (if (string-match-p "[^ACGT]" dna-strand)
    (error "DNA strand must only contain A, C, G or T nucleotides"))
  (apply #'concat (seq-map #'transcribe dna-strand)))

(defun transcribe (nucleotide)
  "Find the RNA transcription of NUCLEOTIDE"
  (let ((n (string nucleotide)))
    (cdr (assoc n rna-transcription-rule))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
