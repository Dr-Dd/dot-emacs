;;; package --- Summary
;;; Commentary:
;;; Notmuch client for reading mail downloaded with isync (mbsync)
;;; and imported into the notmuch db
;;; Code:

;; https://sourceforge.net/projects/isync/files/latest/download

(use-package notmuch :ensure t
  :config
  ;; Image display
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types)))

;; (use-package wanderlust :ensure t)

(provide 'init-drd-mail)
;;; init-drd-mail.el ends here
