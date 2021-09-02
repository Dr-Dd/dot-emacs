;;; package --- Summary
;;; Commentary:
;;; Evil mode for vim-like command emulation
;;; Code:

(use-package evil
  :defer t
  :ensure t
  :config
  (diminish 'overwrite-mode))

;; evil-surround
(use-package evil-surround
  :defer t
  :ensure t
  :after (evil))
(use-package evil-commentary
  :defer t
  :ensure t
  :after (evil)
  :config
  (diminish 'evil-commentary-mode))

;; Simple workaround for fcitx in evil-insert mode
;; Potentially better than fcitx.el
;; https://yoshitia.hatenablog.com/entry/2015/04/02/213710
(add-hook 'evil-normal-state-entry-hook
	  (lambda ()
	    (if (string= "2\n" (shell-command-to-string "fcitx-remote"))
		(shell-command "fcitx-remote -c"))))

(provide 'init-evil-mode)
;;; init-evil-mode.el ends here
