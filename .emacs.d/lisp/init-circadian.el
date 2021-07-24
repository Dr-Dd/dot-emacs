;;; package --- Summary
;;; Commentary:
;;; Circadian for theme switching
;;; Code:

;; Shouldn't  defer since you need it at startup
(use-package circadian
  :ensure t
  :config
  (circadian-setup))

(provide 'init-circadian)
;;; init-circadian.el ends here
