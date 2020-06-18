
(use-package notmuch
  :config
  (setq mail-specify-envelope-from t)
  (setq message-sendmail-envelope-from 'header)
  (setq mail-envelope-from 'header)
  (setq message-kill-buffer-on-exit t)
  (setq notmuch-search-oldest-first nil)
  (setq send-mail-function 'sendmail-send-it)
  ;; Image display
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  )

(provide 'init-drd-mail)
