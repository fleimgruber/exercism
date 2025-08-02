;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-roman (number)
  (let ((hundreds '("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"))
         (tens '("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"))
         (ones '("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX")))
    (setq roman "")
    (while (>= number 1000)
      (setq roman (concat roman "M"))
      (setq number (- number 1000)))
    (setq roman (concat roman (nth (/ number 100) hundreds)))
    (setq number (% number 100))
    (setq roman (concat roman (nth (/ number 10) tens)))
    (setq number (% number 10))
    (setq roman (concat roman (nth number ones)))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
