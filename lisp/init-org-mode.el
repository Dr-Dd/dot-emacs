;;; package --- Summary
;;; Commentary:
;;; All settings related to org-mode
;;; Code:

(defun my/org-get-entry-time (pom &optional inherit)
  "Get the time as a time tuple, if there is none
returns nil."
  (let
      ((time (or (org-entry-get pom "TIMESTAMP" inherit)
                 (org-entry-get pom "SCHEDULED" inherit)
                 (org-entry-get pom "DEADLINE" inherit))))
    (when time
      (org-time-string-to-time time))))

(require 'org-habit)

;; org bullets
(use-package org-superstar :ensure t)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (shell . t)
   (emacs-lisp . nil)))


(use-package htmlize :ensure t)

(global-set-key (kbd "C-c c") 'org-capture)

(use-package org-edna :ensure t)

(require 'ox-latex)
(require 'ox-beamer)

(provide 'init-org-mode)
;;; init-org-mode.el ends here
