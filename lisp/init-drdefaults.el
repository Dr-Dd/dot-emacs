;; Init file for things already present in emacs

(setq initial-scratch-message "")
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(column-number-mode 1)

;; Move custom-set variables to separate file
(setq custom-file (concat user-emacs-directory "custom.el"))

;; remove unwanted buffers
;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Follow symlinks by default
(setq vc-follow-symlinks t)

;; electric indent
(electric-indent-mode 1)

;; enable show paren mode
(show-paren-mode 1)

;; automatically close brackets
(electric-pair-mode 1)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable hl line
(global-hl-line-mode 1)

;; preserve command history between sessions
(savehist-mode 1)

;; replace tabs with spaces
(setq-default indent-tabs-mode nil)
;; require new-lines
(setq-default require-final-newline t)
;; load newer bytecode instead of old
(setq-default load-prefer-newer t)
;; remember cursor position when saving
(save-place-mode 1)
;; backup files handling
(setq backup-directory-alist
      `((".*" . ,my/backup-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,my/backup-directory t)))
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

(global-set-key (kbd "<mouse-6>") 'scroll-right)
(global-set-key (kbd "<mouse-7>") 'scroll-left)
(global-set-key (kbd "M-s-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-j") 'shrink-window)
(global-set-key (kbd "M-s-k") 'enlarge-window)
(global-set-key (kbd "M-s-l") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-t") 'switch-theme)
(global-set-key (kbd "C-c j") 'xref-find-definitions)
(global-set-key (kbd "C-c r") 'xref-find-references)
(global-set-key (kbd "C-c k") 'xref-pop-marker-stack)

;; Don't prompt for refrerences
(use-package xref
  :config (add-to-list 'xref-prompt-for-identifier 'xref-find-references t))

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
(add-hook 'after-make-frame-functions 'force-mode-line-update)

(provide 'init-drdefaults)
