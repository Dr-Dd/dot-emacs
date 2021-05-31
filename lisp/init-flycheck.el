;;; package --- Summary
;;; Commentary:
;;; Syntax checking with flycheck
;;; Code:

;; syntax checking with flycheck
(use-package flycheck
  :ensure t
  :bind (:map flycheck-mode-map
         ("C-c e n" . flycheck-next-error)
         ("C-c e b" . flycheck-previous-error)
         ("C-c e l" . flycheck-list-errors)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
