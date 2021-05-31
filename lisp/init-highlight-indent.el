;;; package --- Summary
;;; Commentary:
;;; Package to higlight indentation lines, could be better
;;; Code:

;; highlight indentation
(use-package highlight-indentation
  :ensure t
  :config
  (diminish 'highlight-indentation-current-column-mode))

(provide 'init-highlight-indent)
;;; init-highlight-indent ends here
