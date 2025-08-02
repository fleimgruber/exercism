;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-roman (number)
  (let ((hundreds '("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"))
         (tens '("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"))
         (ones '("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX"))
         (roman ""))
    (while (>= number 1000)
      (setq roman (concat roman "M"))
      (setq number (- number 1000)))
    (concat roman
            (nth (/ number 100) hundreds)
            (nth (/ (% number 100) 10) tens)
            (nth (% number 10) ones))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
