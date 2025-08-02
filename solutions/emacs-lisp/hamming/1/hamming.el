;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:
(defun hamming-distance (strand-a strand-b)
  (if (not (= (length strand-a) (length strand-b)))
      (error "DNA strands must have the same length"))
  (apply #'+
         (seq-mapn #'compare-nucleotides strand-a strand-b)))

(defun compare-nucleotides (fst snd)
  (if (= fst snd)
      0
    1))

(provide 'hamming)
;;; hamming.el ends here
