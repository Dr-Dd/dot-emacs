
(use-package all-the-icons
  :ensure t
  :config
  (unless (file-exists-p (concat my/all-the-icons-folder "all-the-icons.ttf"))
    (all-the-icons-install-fonts)))

;; (use-package all-the-icons-dired
;;   :ensure t
;;   :config
;;   (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(provide 'init-all-the-icons)
