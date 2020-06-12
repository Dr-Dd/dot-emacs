
;; doom modeline (+ all-the-icons dependency)
(use-package all-the-icons
  :ensure t
  :config
  (unless (file-exists-p "~/.local/share/fonts/all-the-icons.ttf")
    (all-the-icons-install-fonts)))
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25)
  (column-number-mode 1))
(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
;; == end of doom modeline ==

(custom-set-faces
 '(mode-line ((t (:family "xos4 Terminus" :height 0.7 :box nil))))
 '(mode-line-inactive ((t (:family "xos4 Terminus" :height 0.7)))))

(provide 'init-doom-modeline)
