;;; package --- Summary
;;; Commentary:
;;; Evil mode for vim-like command emulation
;;; Code:

(use-package evil
  :ensure t
  :config
  (diminish 'overwrite-mode))

;; evil-surround
(use-package evil-surround
  :ensure t
  :after (evil))
(use-package evil-commentary
  :ensure t
  :after (evil)
  :config
  (diminish 'evil-commentary-mode))

(provide 'init-evil-mode)
;;; init-evil-mode.el ends here
