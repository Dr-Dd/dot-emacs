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

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-20"))

(defvar my/light-theme 'doom-solarized-light)
(defvar my/dark-theme 'doom-vibrant)
(defvar my/current-theme my/light-theme)

(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapc #'disable-theme custom-enabled-themes))

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
(if (or (>= (string-to-number (shell-command-to-string "date +%H")) 21)
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

(add-hook 'server-after-make-frame-hook (lambda () (select-frame-set-input-focus (selected-frame))))


(provide 'init-gui)
