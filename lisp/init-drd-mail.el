
(require 'notmuch)
(setq mail-specify-envelope-from t)
(setq message-sendmail-envelope-from 'header)
(setq mail-envelope-from 'header)
(setq message-kill-buffer-on-exit t)
(setq notmuch-search-oldest-first nil)

(provide 'init-drd-mail)
