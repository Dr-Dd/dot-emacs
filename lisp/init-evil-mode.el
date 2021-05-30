;;; package --- Summary
;;; Commentary:
;;; Evil mode for vim-like command emulation
;;; Code:

(use-package evil
  :ensure t
  :config
  (diminish 'overwrite-mode)
  (evil-set-initial-state 'dashboard-mode 'emacs)
  (evil-set-initial-state 'haskell-interactive-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'tuareg-interactive-mode 'emacs)
  (evil-set-initial-state 'inferior-python-mode 'emacs)
  (evil-set-initial-state 'erc-mode 'emacs)
  (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
  (evil-set-initial-state 'help-mode 'emacs)
  (evil-mode 1)
  ;; Evil Vim-like C-c
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state))

;; The CORRECT WAY to redefine keymaps before they are
;; created (here the problem was that you cannot access
;; xref-buffer-mode-map before an xref buffer is created)
(add-hook 'xref--xref-buffer-mode-hook
          (lambda () (progn (define-key xref--xref-buffer-mode-map (kbd "j") 'next-line)
                            (define-key xref--xref-buffer-mode-map (kbd "k") 'previous-line))))

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1)
  :after (evil))
(use-package evil-commentary
  :ensure t
  :after (evil)
  :config
  (evil-commentary-mode)
  (diminish 'evil-commentary-mode))

(setq evil-ex-search-case 'insensitive)

(provide 'init-evil-mode)

;;; init-evil-mode.el ends here
