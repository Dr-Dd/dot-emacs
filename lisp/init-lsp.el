;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :ensure t
  :hook
  ((prog-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)
   (lsp-managed-mode . lsp-diagnostics-modeline-mode))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-prefer-capf t)
  (with-eval-after-load 'lsp-mode
    ;; :project/:workspace/:file
    (setq lsp-diagnostics-modeline-scope :project))
  :bind
  (:map lsp-mode-map
        ("C-c d" . lsp-describe-thing-at-point)
        ("C-c j" . lsp-find-definition)
        ("C-c r" . lsp-find-references)
        ("M-<return>" . lsp-execute-code-action)))

;; optionally
(use-package lsp-ui :ensure t
  :after (lsp)
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-sideline-code-action ((t (:foreground "goldenrod1"))))
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ([remap xref-find-references] . lsp-ui-peek-find-references)))

(with-eval-after-load 'lsp-ui
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil))

;;if you are helm user
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol
  :after (helm)
  :bind
  (:map lsp-mode-map
        ([remap xref-find-apropos] . helm-lsp-workspace-symbol)))

;; optionally if you want to use debugger
(use-package dap-mode :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
(use-package dap-java
  :after (dap-mode))

;; C-lang language server (ensure that ccls is installed in your system)
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(use-package lsp-java :ensure t )

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (diminish 'which-key-mode))

;; Debugging
;; (setq lsp-print-performance t)

(provide 'init-lsp)
