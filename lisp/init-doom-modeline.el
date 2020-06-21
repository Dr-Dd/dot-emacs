;; doom modeline (+ all-the-icons dependency)
(use-package doom-modeline
  :ensure t)

;; Change font
(custom-set-faces
   '(mode-line ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold))))
   '(mode-line-inactive ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold)))))
;; Align this with `M-: (doom-modeline--font-height)'
(setq doom-modeline-height 21)
;; For displaying icons with `emacsclient -c'
(setq doom-modeline-icon t)
;; Enable the modeline
(doom-modeline-mode 1)

;; TODO: Remove when this gets added in the next commit
(add-hook 'server-after-make-frame-hook #'doom-modeline-refresh-font-width-cache)

(provide 'init-doom-modeline)
