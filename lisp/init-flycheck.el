
;; syntax checking with flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (define-key flycheck-mode-map (kbd "C-c e n") 'flycheck-next-error)
  (define-key flycheck-mode-map (kbd "C-c e b") 'flycheck-previous-error)
  (define-key flycheck-mode-map (kbd "C-c e l") 'flycheck-list-errors)
  )

(provide 'init-flycheck)
