
;; syntax checking with flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (define-key flycheck-mode-map (kbd "C-c e n") 'flycheck-next-error)
  (define-key flycheck-mode-map (kbd "C-c e b") 'flycheck-previous-error)
  (define-key flycheck-mode-map (kbd "C-c e l") 'flycheck-list-errors)
  )

(provide 'init-flycheck)
