;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  (or (and (= (% year 4) 0)
           (not (= (% year 100) 0)))
      (= (% year 400) 0)))

(provide 'leap-year-p)
;;; leap.el ends here
