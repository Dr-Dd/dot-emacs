
;; EVIL MODE!
(use-package evil
  :ensure t
  :config
  (evil-set-initial-state 'dashboard-mode 'emacs)
  (evil-set-initial-state 'haskell-interactive-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'tuareg-interactive-mode 'emacs)
  (evil-set-initial-state 'inferior-python-mode 'emacs)
  (evil-set-initial-state 'erc-mode 'emacs)
  (evil-mode 1)
  ;; keybindings
  (define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)
  (define-key evil-command-window-mode-map (kbd "C-c") 'evil-normal-state)
  )
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
  (evil-commentary-mode))
;; == end of evil mode ==


(provide 'init-evil-mode)
