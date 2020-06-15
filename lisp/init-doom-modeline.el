;; doom modeline (+ all-the-icons dependency)
(use-package doom-modeline
  :ensure t
  :after (all-the-icons)
  :init
  (custom-set-faces
   '(mode-line ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold))))
   '(mode-line-inactive ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold)))))
  (setq doom-modeline-height 25)
  (setq doom-modeline-icon t)
  (doom-modeline-mode 1)
  :config
  )

(provide 'init-doom-modeline)
