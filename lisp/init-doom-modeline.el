;;; package --- Summary
;;; Commentary:
;;; Doom modeline for nicer looking modeline gui, non-essential
;;; Code:

;; all-the-icons dependency
(use-package doom-modeline
  :ensure t)

;; Change font
(custom-set-faces
   '(mode-line ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold))))
   '(mode-line-inactive ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold)))))

(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
