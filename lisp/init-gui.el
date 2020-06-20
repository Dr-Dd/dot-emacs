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

;; == light theme function ==
(defun my/light-theme ()
  (interactive)
  ;; load new theme
  (disable-theme 'doom-one)
  (load-theme 'doom-solarized-light t)
  ;; selected line light color
  ;;(set-face-background 'hl-line "#ccdae9")
  ;;(set-face-foreground 'highlight nil)
  ;; highlight light color
  ;;(set-face-attribute 'region nil :background "#4A90D9" :foreground "#FFFFFF")
  ;; refresh screen
  ;;(refresh-mode-line-font)
  (redraw-display)
  )
;; == end of light theme function ==

(defvar my/light-theme 'doom-solarized-light)
(defvar my/dark-theme 'doom-vibrant)
(defvar my/current-theme my/light-theme)

(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapcar #'disable-theme custom-enabled-themes))

(defun my/switch-theme (theme)
  (if (eq theme 'default)
      (disable-theme my/current-theme)
    (progn
      (load-theme theme t)))
  (setq my/current-theme theme))

(defun my/toggle-theme ()
  (interactive)
  (cond ((eq my/current-theme my/light-theme) (my/switch-theme my/dark-theme))
        ((eq my/current-theme my/dark-theme) (my/switch-theme my/light-theme))))
(global-set-key (kbd "M-t") 'my/toggle-theme)

;; Try to default to a sane default theme
(if (or (>= (string-to-number (shell-command-to-string "date +%H")) 19)
        (< (string-to-number (shell-command-to-string "date +%H")) 7))
    (my/switch-theme my/dark-theme)
  (my/switch-theme my/light-theme))

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

;; HACK
(defun my/doom-modeline-refresh ()
  (interactive)
  (progn
    (doom-modeline-refresh-font-width-cache)
    (message "The doom-modeline--font-width-cache has been reset")))
(global-set-key (kbd "C-c m") 'my/doom-modeline-refresh)

(provide 'init-gui)
