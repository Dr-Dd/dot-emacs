;;; package --- Summary
;;; Commentary:
;;; Notmuch client for reading mail downloaded with isync (mbsync)
;;; and imported into the notmuch db
;;; Code:

;; https://sourceforge.net/projects/isync/files/latest/download

;; Currently it's only linux compatible, shucks!
(defvar my/notmuch-tag-file "~/.config/notmuch/tag-file")

(use-package notmuch :ensure t
  :defer t
  :config
  ;; Image display
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  ;; Add to spam filter functions
  (defun my/notmuch-clean-from-addr (address)
    "Strip a notmuch from address of all useless information except from the
cleaned-address itself. Return the cleaned-address."
    (let* ((clean-address
            (with-temp-buffer
              (insert address)
              (goto-char (point-min))
              (re-search-forward "^\\(.*<\\)")
              (replace-match "")
              (goto-char (point-min))
              (re-search-forward "\\(>.*\\)$")
              (replace-match "")
              (buffer-string))))
      clean-address))

  (defun my/notmuch-search-get-from-addr ()
    "Get full from address attribute from notmuch message interactively on the
search page."
    (interactive)
    (let* ((thread-id (notmuch-search-find-thread-id))
           (address (with-temp-buffer
                      (if thread-id
                          (progn (notmuch-show thread-id)
                                 (notmuch-show-get-from))
                        (message "End of search results.")))))
      (kill-buffer (concat "*notmuch-" thread-id "*"))
      address))

  (defun my/notmuch-append-line-from-addr-to-tag-file (address tags tag-file)
    "Add a filtering line of the following form to TAG-FILE:

+tag1 -tag2 ... -- from:address@domain.org

using supplied TAGS, ADDRESS."
    (with-temp-buffer
      (insert (concat tags " -- from:" address "\n"))
      (append-to-file (point-min) (point-max) tag-file)))

  (defun my/notmuch-search-add-from-addr-to-spam-filter ()
    "Interactively add a from address to `my/notmuch-tag-file' filtered from
the tags \"+spam -inbox -unread\""
    (interactive)
    (let* ((addr (my/notmuch-clean-from-addr (my/notmuch-search-get-from-addr))))
      (my/notmuch-append-line-from-addr-to-tag-file addr "+spam -inbox -unread" my/notmuch-tag-file)
      (shell-command "notmuch new")
      (notmuch-refresh-this-buffer)))

  ;; Keybindings
  (define-key notmuch-search-mode-map (kbd "C-+") 'my/notmuch-search-add-from-addr-to-spam-filter))

(provide 'init-drd-mail)
;;; init-drd-mail.el ends here
