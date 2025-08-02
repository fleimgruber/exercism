;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(defun to-rna (dna-strand)
  (if (string-match-p "[^ACGT]" dna-strand)
    (error "DNA strand must only contain A, C, G or T nucleotides"))
  (apply #'concat (seq-map #'transcribe dna-strand)))

(string-match-p "[^ACGT]" "G")

(defun transcribe (nucleotide)
  (let ((ttmap '(("A" . "U") ("C" . "G") ("G" . "C") ("T" . "A")))
        (n (string nucleotide)))
    (cdr (assoc n ttmap))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
