;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :ensure t
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-prefer-capf t
        gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024))
  (with-eval-after-load 'lsp-mode
    ;; :project/:workspace/:file
    (setq lsp-diagnostics-modeline-scope :project)
    (add-hook 'lsp-managed-mode-hook 'lsp-diagnostics-modeline-mode))
  ;; Keybindings
  (define-key lsp-mode-map (kbd "C-c d") 'lsp-describe-thing-at-point)
  (define-key lsp-mode-map (kbd "C-c j") 'lsp-find-definition))

;; optionally
(use-package lsp-ui :ensure t :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))
;;if you are helm user
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list
  :config (lsp-treemacs-sync-mode 1)
  :bind
  (:map lsp-mode-map
        ;;("s-l g e" . nil)
        ("C-c e t" . lsp-treemacs-errors-list)))

;; optionally if you want to use debugger
(use-package dap-mode :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
(use-package dap-java)

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
  (which-key-mode))

;; Debugging
;; (setq lsp-print-performance t)

(provide 'init-lsp)
