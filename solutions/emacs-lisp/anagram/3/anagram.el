;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun word-to-chars (word)
  "Split WORD to list of individual characters."
  (cl-remove-if #'string-empty-p (split-string word "")))

(defun sort-word (word)
  "Sort WORD alphabetically."
  (let ((sorted-chars (sort (word-to-chars word) #'string<)))
    (mapconcat 'identity sorted-chars "")))

(defun string-compare (first second)
  "Check if strings FIRST and SECOND are (true) anagrams.
An anagram is a true anagram if it is not just the exact same word."
  (and (not (string= first second))
       (string= (sort-word (downcase first)) (sort-word (downcase second)))))

(defun anagrams-for (word possible)
  "Select elements of POSSIBLE if they are true anagrams of WORD."
  (cl-remove-if-not #'(lambda (x) (string-compare x word)) possible))

(provide 'anagram)
;;; anagram.el ends here
