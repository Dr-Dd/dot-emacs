;;; package --- Summary
;;; Commentary:
;;; Notmuch client for reading mail downloaded with isync (mbsync)
;;; and imported into the notmuch db
;;; Code:

;; https://sourceforge.net/projects/isync/files/latest/download

;; Currently it's only linux compatible, shucks!
(defvar my/notmuch-tag-file "~/.config/notmuch/tag-file")

(defvar my/refresh-inbox-command "mbsync -a; notmuch new")

;; Don't simply ensure, install from distro package manager
(use-package notmuch
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
      (message "Updating notmuch database...")
      (shell-command "notmuch new")
      (notmuch-refresh-this-buffer)
      (message "Added From Address to Spam Filter")))

  (defun my/notmuch-download-new-mail ()
    "Interactively try to download new mail by manually polling the mail server.
Emacs will execute the `my/refresh-inbox-command' synchronously and refresh the.
notmuch buffer."
    (interactive)
    (message "Synchronously downloading mail, hang on tight...")
    (shell-command my/refresh-inbox-command)
    (notmuch-refresh-this-buffer))

  ;; Keybindings
  (define-key notmuch-search-mode-map (kbd "C-+") 'my/notmuch-search-add-from-addr-to-spam-filter)
  (define-key notmuch-search-mode-map (kbd "C-c g") 'my/notmuch-download-new-mail))

;; Trash
;; (use-package org-mime
;;   :ensure t)

(defun my/add-mime ()
  (interactive)
  (let* ((attachment (progn (goto-char (point-min))
			    (re-search-forward "<#part.*disposition=attachment>
<#/part>" nil t nil)
			    (kill-region (match-beginning 0) (match-end 0))
			    (pop kill-ring)))
	 (body-beg (progn (message-goto-body)
			  (point)))
	 (body-end (progn (message-goto-signature)
			  (forward-line -2)
			  (point)))
	 (body (progn (kill-region body-beg body-end)
		      (pop kill-ring)))
	 )
    (message-goto-body)
    (insert "<#multipart type=alternative>\n<#part type=text/plain>\n")
    (insert body)
    (insert "<#part type=text/html>\n<p>\n")
    (insert body)
    (insert "</p>")
    ;; The rest is signature
    (goto-char (point-max))
    (insert "<#/multipart>\n")
    (insert attachment)
    (message-goto-body)))

;; (add-hook 'message-send-hook
;; 	  (lambda ()
;; 	    (my/add-mime)))


(autoload 'gnus-alias-determine-identity "gnus-alias" "" t)
;; Define rules to match work identity
(add-hook 'message-setup-hook 'gnus-alias-determine-identity)

;; Interesting but too complex
;; (use-package org-msg
;;   :ensure t
;;   :config
;;   (org-msg-mode))

(provide 'init-drd-mail)
;;; init-drd-mail.el ends here
