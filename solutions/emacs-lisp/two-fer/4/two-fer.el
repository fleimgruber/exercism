;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  (let ((who (or name "you")))
    (format "One for %s, one for me." who)))

(provide 'two-fer)
;;; two-fer.el ends here
