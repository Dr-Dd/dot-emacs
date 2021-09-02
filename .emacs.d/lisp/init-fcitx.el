;;; package --- Summary
;;; Commentary:
;;; Just my init file
;;; Code:

;; Your typeface should be able to print the following characters
;; かな
;; if not, add the required typeface(s) to your distribution

;; DBus is stuck with fcitx4, while fcitx5 service name is different
;; so FIXME in fcitx.el
(use-package fcitx
  :ensure t
  :config
  (setq fcitx-remote-command "fcitx5-remote")
  (fcitx-default-setup))

(provide 'init-fcitx)
;;; init-fcitx.el ends here
