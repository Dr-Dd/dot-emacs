
;; custom splash screen with emacs-dashboard
(use-package page-break-lines
  :ensure t)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  ;; enable for emacs --daemon
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))

(with-eval-after-load 'dashboard
  (progn
    (setq dashboard-set-footer nil)
    (setq dashboard-banner-logo-title (shell-command-to-string "fortune -as -n 110 | tr -s '\n' ' ' | tr -s '\t' ' '"))
    (setq dashboard-startup-banner 'official)
    (setq dashboard-items '((agenda . 5)
                            (recents  . 9)))
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-navigator t)
    (setq dashboard-set-init-info nil)
    (setq dashboard-navigator-buttons
          `(;; 1° entry
            ((,(all-the-icons-fileicon "emacs" :height 0.8 :v-adjust 0.0)
              "emacs-workspace"
              "Dired to your Emacs Workspace"
              (lambda (&rest _) (dired my/emacs-workspace-directory)))
             ;; 2° entry
             (,(all-the-icons-alltheicon "git" :height 0.8 :v-adjust 0.0)
              "git-repos"
              "Dired to your Git Repos"
              (lambda (&rest _) (dired my/git-repos-directory)))
             ;; 3°entry
             (,(all-the-icons-octicon "file-symlink-file" :height 0.8 :v-adjust 0.0)
              "init.el"
              "Open init.el config file"
              (lambda (&rest _) (find-file (concat user-emacs-directory "init.el"))))
             ;; 4° entry
             (,(all-the-icons-octicon "book" :height 0.8 :v-adjust 0.0)
              "agenda"
              "Open your agenda"
              (lambda (&rest _) (org-agenda 0 "d")))
             ;; 5° entry
             (,(all-the-icons-octicon "mail" :height 0.8 :v-adjust 0.0)
              "notmuch"
              "Read your inbox"
              (lambda (&rest _) (notmuch)))
             ;; 6° entry
             (,(all-the-icons-octicon "home" :height 0.8 :v-adjust 0.0)
              "home"
              "Dired to your Home"
              (lambda (&rest _) (dired my/user-home))))
            ))))

(provide 'init-drdashboard)
