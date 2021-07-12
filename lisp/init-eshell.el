;;; package --- Summary
;;; Commentary:
;;; eshell functions
;;; Code:

(defun my/end-of-line-point ()
  "Return the end of line point of the current line."
  (save-excursion
    (let* ((eol-point
            (progn (end-of-line)
                   (point))))
      eol-point)))

(defun my/eshell-buffer-working-dir ()
  "Switch the directory of the buffer named *eshell* to the current working dir."
  (interactive)
  (let ((def-dir default-directory))
    (if (not (eq (get-buffer "*eshell*") nil))
        (with-current-buffer "*eshell*"
          (eshell-return-to-prompt)
          (delete-region (point) (my/end-of-line-point))
          (insert (concat "cd " def-dir))
          (eshell-send-input))
      (eshell))))

(define-key global-map (kbd "C-c x") 'eshell-command)

(provide 'init-eshell)
;;; init-eshell.el ends here
