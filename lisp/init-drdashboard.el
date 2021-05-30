;;; package --- Summary
;;; Commentary:
;;; Nice introduction page to manage common Emacs usage
;;; Code:

;; custom splash screen with emacs-dashboard
(use-package page-break-lines
  :ensure t)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(with-eval-after-load 'dashboard
  (setq dashboard-banner-logo-title (shell-command-to-string "fortune -as -n 110 | tr -s '\n' ' ' | tr -s '\t' ' '")))

(provide 'init-drdashboard)
;;; init-drdashboard.el ends here
