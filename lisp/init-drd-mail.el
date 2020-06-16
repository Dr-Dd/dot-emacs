
(use-package notmuch
  :config
  (setq mail-specify-envelope-from t)
  (setq message-sendmail-envelope-from 'header)
  (setq mail-envelope-from 'header)
  (setq message-kill-buffer-on-exit t)
  (setq notmuch-search-oldest-first nil)
  ;; Image display
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))
  (setq mm-text-html-renderer 'eww))
;; w3m, hmtl2text

(provide 'init-drd-mail)
