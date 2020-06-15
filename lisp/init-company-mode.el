;; company-mode autocompletion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook  'global-company-mode)
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2
  (diminish 'company-mode)
  ;; keybindings
  :bind
  (:map global-map
        ("C-<SPC>" . company-complete))
  (:map company-active-map
        ("<tab>" . company-select-next-or-abort)
        ("<backtab>" . company-select-previous-or-abort)))

(use-package company-c-headers
  :ensure t
  :after (company)
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-lsp :ensure t
  :after (lsp company)
  :config
  (push 'company-lsp company-backends))
(use-package company-quickhelp :ensure t
  :after (company)
  :config
  (company-quickhelp-mode)
  (setq company-quickhelp-delay 0.2))


(provide 'init-company-mode)
