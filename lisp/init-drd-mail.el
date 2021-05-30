;;; package --- Summary
;;; Commentary:
;;; Notmuch client for reading mail downloaded with isync (mbsync)
;;; and imported into the notmuch db
;;; Code:

(use-package notmuch
  :config
  ;; Image display
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  )

(provide 'init-drd-mail)
;;; init-drd-mail.el ends here
