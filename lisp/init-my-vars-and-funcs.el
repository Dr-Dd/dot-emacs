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

;; HACK
(defun my/doom-modeline-refresh ()
  (interactive)
  (progn
    (doom-modeline-refresh-font-width-cache)
    (message "The doom-modeline--font-width-cache has been reset")))
(global-set-key (kbd "C-c m") 'my/doom-modeline-refresh)

(provide 'init-my-vars-and-funcs)
