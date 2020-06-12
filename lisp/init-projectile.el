(use-package projectile
  :ensure t
  :config (progn
            ((projectile-mode +1)
             (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
             (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))))

(provide 'init-projectile)
