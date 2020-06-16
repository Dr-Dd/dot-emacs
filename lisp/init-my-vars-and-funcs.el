(cond
 ;; GNU/Linux (someone liked to interject for a moment)
 ((string=  system-type "gnu/linux")
  (setq my/user-home "~/"
        my/user-org-files-directory "~/Sync/org-files/"
        my/all-the-icons-folder "~/.local/share/fonts/"
        my/emacs-workspace-directory "~/emacs-workspace/"
        my/git-repos-directory "~/.git-repos/"
        my/cloud-storage-directory "~/MEGA/"
        my/backup-directory "~/.saves/"))
 ;; Windows 10
 ;; ((string=  system-type "windows-nt")
 ;;  (setq my/user-home ""
 ;;        my/backup-directory ""))
 ;; MacOS
 ;; ((string=  system-type "darwin")
 ;;  (setq my/user-home ""
 ;;        my/backup-directory ""))
)

(defun my/do-if-specified-night-time (evening-start evening-end evening-action morning-action)
  (if (or (>= (string-to-number (shell-command-to-string "date +%H")) evening-start)
          (< (string-to-number (shell-command-to-string "date +%H")) evening-end))
      (evening-action)
    (morning-action)))

  ;; (if (or (>= (string-to-number (shell-command-to-string "date +%H")) evening-time)
  ;;         (< (string-to-number (shell-command-to-string "date +%H")) morning-time))
  ;;     (evening-action)
  ;;   (morning-action)))

(provide 'init-my-vars-and-funcs)
