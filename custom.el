;;; package --- Summary
;;; Commentary:
;;; Custom "custom.el" file
;;; Code:

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold))))
 '(mode-line-inactive ((t (:family "xos4 Terminus" :height 0.7 :box nil :weight bold))))
 '(org-level-1 ((t (:inherit default :foreground "#cb4b16" :height unspecified))))
 '(org-level-2 ((t (:inherit default :foreground "#859900" :height unspecified))))
 '(org-level-3 ((t (:inherit default :foreground "#268bd2" :height unspecified))))
 '(org-level-4 ((t (:inherit default :foreground "#b58900" :height unspecified)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms '((".*" "~/.saves/" t)))
 '(backup-by-copying t)
 '(backup-directory-alist '((".*" . "~/.saves/")))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-file "~/.emacs.d/custom.el")
 '(dashboard-items '((recents . 9)))
 '(dashboard-navigator-buttons
   '(((#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "file-icons" :height 0.96)
                         face
                         (:family "file-icons" :height 0.96)))
       "emacs-workspace" "Dired to your Emacs Workspace"
       (lambda
         (&rest _)
         (dired my/emacs-workspace-directory)))
      (#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "all-the-icons" :height 0.96)
                         face
                         (:family "all-the-icons" :height 0.96)))
       "git-repos" "Dired to your Git Repos"
       (lambda
         (&rest _)
         (dired my/git-repos-directory)))
      (#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "github-octicons" :height 0.96)
                         face
                         (:family "github-octicons" :height 0.96)))
       "init.el" "Open init.el config file"
       (lambda
         (&rest _)
         (find-file
          (concat user-emacs-directory "init.el"))))
      (#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "github-octicons" :height 0.96)
                         face
                         (:family "github-octicons" :height 0.96)))
       "agenda" "Open your agenda"
       (lambda
         (&rest _)
         (org-agenda 0 "d")))
      (#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "github-octicons" :height 0.96)
                         face
                         (:family "github-octicons" :height 0.96)))
       "notmuch" "Read your inbox"
       (lambda
         (&rest _)
         (notmuch)))
      (#("" 0 1
         (rear-nonsticky t display
                         (raise 0.0)
                         font-lock-face
                         (:family "github-octicons" :height 0.96)
                         face
                         (:family "github-octicons" :height 0.96)))
       "home" "Dired to your Home"
       (lambda
         (&rest _)
         (dired my/user-home))))))
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-init-info nil)
 '(dashboard-set-navigator t)
 '(delete-old-versions t)
 '(display-line-numbers-type 'relative)
 '(doom-modeline-height 21)
 '(doom-modeline-icon t)
 '(doom-modeline-mode t)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(evil-undo-system 'undo-tree)
 '(flycheck-emacs-lisp-load-path 'inherit)
 '(global-flycheck-mode t)
 '(global-hl-line-mode t)
 '(global-undo-tree-mode t)
 '(helm-mode t)
 '(history-delete-duplicates t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice '(lambda nil (get-buffer-create "*dashboard*")))
 '(initial-scratch-message nil)
 '(kept-new-versions 6)
 '(load-prefer-newer t)
 '(mail-envelope-from 'header)
 '(mail-specify-envelope-from t)
 '(menu-bar-mode nil)
 '(message-kill-buffer-on-exit t)
 '(message-sendmail-envelope-from 'header)
 '(package-selected-packages
   '(org-ref zenburn-theme yasnippet-snippets which-key use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil origami org-superstar org-edna lsp-java htmlize highligh t-indentation helm-lsp flycheck evil-surround evil-commentary doom-themes doom-modeline diminish dashboard company-quickhelp company-lsp company-c-headers company-box ccls))
 '(require-final-newline t)
 '(save-place-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(send-mail-function 'sendmail-send-it)
 '(show-paren-mode t)
 '(split-height-threshold 33)
 '(split-width-threshold 62)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t)
 '(version-control t)
 '(warning-suppress-types '((lsp-mode) (:warning)))
 '(x-gtk-use-system-tooltips nil)
 '(xref-prompt-for-identifier
   '(not xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame xref-find-references))
 '(yas-global-mode t))

(provide 'custom)
;;; custom.el ends here
