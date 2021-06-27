;;; package --- Summary
;;; Commentary:
;;; Just my init file
;;; Code:

(defun nusplit--get-var-cus (var)
  "Get name of file that defined customizable VAR."
  (file-name-base (symbol-file var)))

(defun nusplit--displace-custom-set-variables ()
  "Parse \"custom-set-variables\" and displaces its contents to correct custom file."
  (set-buffer (find-file-noselect custom-file))
  (down-list 2)
  ;; Now we are at the first element of the first (possibly only) grouping

  )



;;; nusplit.el ends here
