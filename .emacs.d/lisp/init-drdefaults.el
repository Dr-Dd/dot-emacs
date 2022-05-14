;;; package --- Summary
;;; Commentary:
;;; Init file for things already present in Emacs
;;; Code:

;; Move custom-set variables to separate file
;; this is allowed via setq as described by docs
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

(global-set-key (kbd "<mouse-6>") 'scroll-right)
(global-set-key (kbd "<mouse-7>") 'scroll-left)
(global-set-key (kbd "C-c j") 'xref-find-definitions)
(global-set-key (kbd "C-c k") 'xref-pop-marker-stack)
(global-set-key (kbd "C-c r") 'xref-find-references)
(global-set-key (kbd "C-c s") 'xref-find-apropos)

(defun my/disable-scroll-bars (frame)
  "Remove scrollbars from new FRAME."
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
;; Remove scrollbar on each new FRAME.
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

;; System ssh-agent integration
(use-package exec-path-from-shell
  :ensure t
  :defer t)
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
(when (daemonp)
  (exec-path-from-shell-initialize))

(defun my/update-recentf-if-last-frame-and-kill ()
  "Wrapper function to execute some custom actions before killing the last frame/buffer."
  (interactive)
  (let* ((tot-num-of-frames (length (frame-list)))
	 (num-of-frames
	  (if (and (daemonp) (> tot-num-of-frames 1))
	      (- tot-num-of-frames 1)
	    tot-num-of-frames)))
    (if (= num-of-frames 1)
	(recentf-save-list))
    (save-buffers-kill-terminal)))

(global-set-key (kbd "C-x C-c") 'my/update-recentf-if-last-frame-and-kill)

(provide 'init-drdefaults)
;;; init-drdefaults.el ends here
