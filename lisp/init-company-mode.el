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
        ("C-<SPC>" . company-complete)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<backtab>") #'company-select-previous) )


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
  (setq company-quickhelp-delay 0.2)
  (setq company-quickhelp-use-propertized-text t)
  (set-face-attribute 'company-quickhelp-face nil :height 160))

(provide 'init-company-mode)
