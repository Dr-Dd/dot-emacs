;; To fully separate emacs' responsibilities from
;; X11's
(setq inhibit-x-resources t)

;; install custom theme (if missing)
(unless (package-installed-p 'zenburn-theme)
  (package-refresh-contents)
  (package-install 'zenburn-theme))

;; remove unwanted ui elements
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
(add-hook 'after-make-frame-functions 'force-mode-line-update)

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-20"))

(defun my/set-font-to-variable nil
  (interactive)
  (setq buffer-face-mode-face
        '(:family "DejaVu Sans" :height 180))
  (buffer-face-mode))

;; set default help major mode font
(add-hook 'help-mode-hook 'my/set-font-to-variable)

;; fallback font
(set-fontset-font "fontset-default" 'unicode "DejaVu Sans Mono-20")

;; == light theme function ==
(defun light-theme ()
  (interactive)
  ;; load new theme
  (disable-theme 'zenburn)
  (load-theme 'adwaita t)
  ;; selected line light color
  (set-face-background 'hl-line "#ccdae9")
  (set-face-foreground 'highlight nil)
  ;; highlight light color
  (set-face-attribute 'region nil :background "#4A90D9" :foreground "#FFFFFF")
  ;; refresh screen
  ;;(refresh-mode-line-font)
  (redraw-display)
  )
;; == end of light theme function ==

;; == dark theme function ==
(defun dark-theme ()
  (interactive)
  ;; load dark theme
  (disable-theme 'adwaita)
  (load-theme 'zenburn t)
  ;; highlight light color
  (set-face-attribute 'region nil :background "#FFFFEF" :foreground "#383838")
  ;; refresh display
  ;;(refresh-mode-line-font)
  (redraw-display)
  )
;; == end of dark theme function ==

;; switches from one theme to the other
(defun switch-theme ()
  (interactive)
  (if (equal (face-attribute 'default :background) "#EDEDED") (dark-theme)
    (light-theme)))

;; set theme as dark if hh >= 19
(if (or (>= (string-to-number (shell-command-to-string "date +%H")) 19)
        (< (string-to-number (shell-command-to-string "date +%H")) 7))
    (dark-theme)
  (light-theme))

;; set default empty line fringe
(setq-default indicate-empty-lines t)
(progn
  (define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
  (setcdr (assq 'empty-line fringe-indicator-alist) 'tilde))
(set-fringe-bitmap-face 'tilde 'font-lock-function-name-face)

;; default window splitting preferences (max size on my screen is 62*33)
(setq split-height-threshold 33)
(setq split-width-threshold 62)

;; Emacs 26.2 line-numbers
(setq display-line-numbers-type 'relative)
;; enable only for programming major modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Enable cursor blinking
(blink-cursor-mode 1)

;; Start maximized
(add-to-list 'default-frame-alist
             '(fullscreen . maximized))

(diminish 'auto-revert-mode)
(diminish 'undo-tree-mode)
(diminish 'eldoc-mode)
(diminish 'overwrite-mode)

(provide 'init-gui)
