;; Init file for things already present in emacs

;; Move custom-set variables to separate file
(setq custom-file (concat user-emacs-directory "custom.el"))

;; remove unwanted buffers
;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; install custom theme (if missing)
(unless (package-installed-p 'zenburn-theme)
  (package-refresh-contents)
  (package-install 'zenburn-theme))
;; Follow symlinks by default

(setq vc-follow-symlinks t)
;; == end of symlink ==

;; electric indent
(electric-indent-mode 1)
;; == end of electric indent ==

;; enable show paren mode
(add-hook 'after-init-hook 'show-paren-mode)
;; == end of show paren mode ==

;; automatically close brackets
(electric-pair-mode 1)
;; == end of auto closing brackets ==

;; remove unwanted ui elements
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;; == end of unwanted ui ==

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; == end of trailing whitespace ==

;; set default font
(add-to-list 'default-frame-alist
             '(font . "Inconsolata-20"))
(set-fontset-font "fontset-default" 'unicode "DejaVu Sans Mono-20")
;; fallback unicode font
;; == end of default font ==

;; enable hl line
(global-hl-line-mode 1)

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
;; == END OF COLORS AND THEME ==

;; set default empty line fringe
(setq-default indicate-empty-lines t)
(progn
  (define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
  (setcdr (assq 'empty-line fringe-indicator-alist) 'tilde))
(set-fringe-bitmap-face 'tilde 'font-lock-function-name-face)
;; == end of default empty line ==

;; default window splitting preferences (max size on my screen is 62*33)
(setq split-height-threshold 33)
(setq split-width-threshold 62)
;; == end of default window splitting ==

;; preserve command history between sessions
(savehist-mode 1)
;; == end of command history ==

;; ido mode
(setq ido-separator "\n")
(setq ido-everywhere t)
(ido-mode 1)
;; == end of ido mode ==

;; Emacs 26.2 line-numbers
(setq display-line-numbers-type 'relative)
;; enable only for programming major modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; enable globally
;;(global-display-line-numbers-mode)
;; == end of line numbers ==

;; replace tabs with spaces
(setq-default indent-tabs-mode nil)
;; require new-lines
(setq-default require-final-newline t)
;; load newer bytecode instead of old
(setq-default load-prefer-newer t)
;; remember cursor position when saving
(save-place-mode 1)
;; == end of no-tabs ==
;; backup files handling
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
;; == end of backups customization ==

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
;; == end of unwanted buffers ==


(global-set-key (kbd "<mouse-6>") 'scroll-right)
(global-set-key (kbd "<mouse-7>") 'scroll-left)
(global-set-key (kbd "M-s-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-j") 'shrink-window)
(global-set-key (kbd "M-s-k") 'enlarge-window)
(global-set-key (kbd "M-s-l") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-t") 'switch-theme)

(provide 'init-drdefaults)
