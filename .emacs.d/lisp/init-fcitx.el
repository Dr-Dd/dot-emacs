;;; package --- Summary
;;; Commentary:
;;; Just my init file
;;; Code:

;; DBus is stuck with fcitx4, while fcitx5 service name is different
;; , so FIXME
(use-package fcitx
  :ensure t
  :config
  (setq fcitx-remote-command "fcitx5-remote")
  (fcitx-default-setup))

(provide 'init-fcitx)
;;; init-fcitx.el ends here
