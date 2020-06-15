(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup)
  (if (equal (face-attribute 'default :background) "#EDEDED")
    (setq sml/theme 'light))
  )

(provide 'init-simple-modeline)
