;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun word-to-chars (word)
  (remove-if #'string-empty-p (split-string word "")))

(defun sort-word (word)
  (let ((sorted-chars (sort (word-to-chars word) #'string<)))
    (mapconcat 'identity sorted-chars "")))

(defun string-compare (fst snd)
  (and (not (string= fst snd))
       (string= (sort-word (downcase fst)) (sort-word (downcase snd)))))

(defun anagrams-for (word possible)
  "Selects elements of POSSIBLE if they are true anagrams of WORD"
  (remove-if-not #'(lambda (x) (string-compare x word)) possible))

(provide 'anagram)
;;; anagram.el ends here
