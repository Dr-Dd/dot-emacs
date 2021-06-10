;;; Package --- summary
;;; Commentary:
;;; Code:

(use-package elfeed :ensure t)

(push '(star notmuch-search-flagged-face) elfeed-search-face-alist)

(defalias 'elfeed-search-toggle-star
  (elfeed-expose #'elfeed-search-toggle-all 'star))
(defalias 'elfeed-show-toggle-star
  (elfeed-expose #'elfeed-show-tag 'star))

(eval-after-load 'elfeed-search
  '(define-key elfeed-search-mode-map (kbd "m") 'elfeed-search-toggle-star))
(eval-after-load 'elfeed-show
  '(define-key elfeed-show-mode-map (kbd "m") 'elfeed-show-toggle-star))

(define-key elfeed-show-mode-map (kbd "SPC") 'elfeed-show-next)
(define-key elfeed-show-mode-map (kbd "S-SPC") 'elfeed-show-prev)

;; ;; REWORK TO TOGGLE IN SHOW BUFFERS TOO
;; (defun elfeed-search-toggle-all (tag)
;;   "Toggle TAG on all selected entries."
;;   (interactive (list (intern (read-from-minibuffer "Tag: "))))
;;   (let ((entries (elfeed-search-selected)) entries-tag entries-untag)
;;     (cl-loop for entry in entries
;;              when (elfeed-tagged-p tag entry)
;;              do (push entry entries-untag)
;;              else do (push entry entries-tag))
;;     (elfeed-tag entries-tag tag)
;;     (elfeed-untag entries-untag tag)
;;     (mapc #'elfeed-search-update-entry entries)
;;     (unless (or elfeed-search-remain-on-entry (use-region-p))
;;       (forward-line))))
;;
;; ;; THIS COULD BE BETTER SUITED
;; (defun elfeed-show-tag (&rest tags)
;;   "Add TAGS to the displayed entry."
;;   (interactive (list (intern (read-from-minibuffer "Tag: "))))
;;   (let ((entry elfeed-show-entry))
;;     (apply #'elfeed-tag entry tags)
;;     (with-current-buffer (elfeed-search-buffer)
;;       (elfeed-search-update-entry entry))
;;     (elfeed-show-refresh)))
;;
;; ;; THIS TOO
;; (defun elfeed-show-untag (&rest tags)
;;   "Remove TAGS from the displayed entry."
;;   (interactive (let* ((tags (elfeed-entry-tags elfeed-show-entry))
;;                       (names (mapcar #'symbol-name tags))
;;                       (select (completing-read "Untag: " names nil :match)))
;;                  (list (intern select))))
;;   (let ((entry elfeed-show-entry))
;;     (apply #'elfeed-untag entry tags)
;;     (with-current-buffer (elfeed-search-buffer)
;;       (elfeed-search-update-entry entry))
;;     (elfeed-show-refresh)))

(provide 'init-drd-newsfeed)
;;; init-drd-newsfeed.el ends here
