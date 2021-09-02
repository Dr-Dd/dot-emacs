;;; package --- Summary
;;; Commentary:
;;; Just my init file
;;; Code:

;; Your typeface should be able to print the following characters
;; かな
;; if not, add the required typeface(s) to your distribution

(use-package fcitx
  :ensure t
  :config
  (fcitx-default-setup)
  (setq fcitx-use-dbus t))

(provide 'init-fcitx)
;;; init-fcitx.el ends here
