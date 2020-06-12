;; company-mode autocompletion
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook  'global-company-mode)
  ;; keybindings
  (global-set-key (kbd "C-<SPC>" ) 'company-complete)
  (if (package-installed-p 'yasnippet)
      (global-set-key (kbd "M-<SPC>" ) 'company-yasnippet))
  )
;; == end of autocompletion ==


(provide 'init-company-mode)
