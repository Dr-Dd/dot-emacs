(use-package projectile
  :ensure t
  :config
  (diminish 'projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'init-projectile)
