;;; package --- Summary
;;; Commentary:
;;; Gui related settings for Emacs.  Not necessarily related
;;; to only the "gui" way of spawning Emacs (gui is used in the
;;; true sense of the term), so it also applies for some terminal
;;; Emacs' settings.
;;; Code:

;; To fully separate emacs' responsibilities from
;; X11's
(setq inhibit-x-resources t)

;; install custom theme (if missing)
(unless (package-installed-p 'zenburn-theme)
  (package-refresh-contents)
  (package-install 'zenburn-theme))

(set-fontset-font "fontset-default" nil (font-spec :size 20 :name "DejaVu Sans Mono"))
(set-fontset-font "fontset-default" nil (font-spec :size 20 :name "Noto Color Emoji"))

;; set default empty line fringe
(defun my/set-fringe-vim-style ()
  (progn (define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
         (setcdr (assq 'empty-line fringe-indicator-alist) 'tilde))
  (set-fringe-bitmap-face 'tilde 'font-lock-function-name-face))
(my/set-fringe-vim-style)

(diminish 'auto-revert-mode)
(diminish 'undo-tree-mode)
(diminish 'eldoc-mode)
(diminish 'overwrite-mode)

(provide 'init-gui)
;;; init-gui.el ends here
