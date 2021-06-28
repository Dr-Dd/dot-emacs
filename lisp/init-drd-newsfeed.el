;;; Package --- summary
;;; Commentary:
;;; Code:

(use-package elfeed :ensure t)

(define-key elfeed-show-mode-map (kbd "SPC") 'elfeed-show-next)
(define-key elfeed-show-mode-map (kbd "S-SPC") 'elfeed-show-prev)

(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "youtube\\.com"
                              :add 'unwatched
                              :remove 'unread))

(push '(star diary-anniversary) elfeed-search-face-alist)
(defalias 'elfeed-search-toggle-star
  (elfeed-expose #'elfeed-search-toggle-all 'star))
(defalias 'elfeed-show-toggle-star
  (elfeed-expose #'elfeed-show-tag 'star))
(eval-after-load 'elfeed-search
  '(define-key elfeed-search-mode-map (kbd "m") 'elfeed-search-toggle-star))
(eval-after-load 'elfeed-show
  '(define-key elfeed-show-mode-map (kbd "m") 'elfeed-show-toggle-star))


(push '(interesting font-lock-string-face) elfeed-search-face-alist)
(defalias 'elfeed-search-toggle-interesting
  (elfeed-expose #'elfeed-search-toggle-all 'interesting))
(defalias 'elfeed-show-toggle-interesting
  (elfeed-expose #'elfeed-show-tag 'interesting))
(eval-after-load 'elfeed-search
  '(define-key elfeed-search-mode-map (kbd "j") 'elfeed-search-toggle-interesting))
(eval-after-load 'elfeed-show
  '(define-key elfeed-show-mode-map (kbd "j") 'elfeed-show-toggle-interesting))


(push '(unwatched default) elfeed-search-face-alist)
(defun my/yt-to--mpv (video-link)
  (start-process "mpv-yt" nil "mpv" "--ytdl-format=22" video-link)
  (message "Loading youtube video to mpv..."))
(defun my/elfeed-search-yt-to-mpv ()
    (interactive)
    (let ((entry (elfeed-search-selected :single)))
      (my/yt-to--mpv (elfeed-entry-link entry))))
(defalias 'elfeed-search-toggle-unwatched
  (elfeed-expose #'elfeed-search-toggle-all 'unwatched))
(defalias 'elfeed-show-toggle-unwatched
  (elfeed-expose #'elfeed-show-tag 'unwatched))
(eval-after-load 'elfeed-search
  '(define-key elfeed-search-mode-map (kbd "v")
     (lambda ()
       (interactive)
       (save-excursion (my/elfeed-search-yt-to-mpv))
       (elfeed-search-toggle-unwatched))))
(eval-after-load 'elfeed-show
  '(define-key elfeed-show-mode-map (kbd "v")
     (lambda ()
       (interactive)
       (save-excursion (elfeed-show-toggle-unwatched))
       (my/elfeed-search-yt-to-mpv))))
(eval-after-load 'elfeed-search
  '(define-key elfeed-search-mode-map (kbd "V")
       'elfeed-search-toggle-unwatched))

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

(defun my/create-elfeed-tags-table ()
  "Create hash-table from elfeed feeds, organized by tag (title in xml form)."
  (let* ((tag-feeds-hash (make-hash-table :test 'equal)))
    (dolist (e elfeed-feeds)
      (let* ((url (car e))
             (tag (car (cdr e))))
        (if (not (listp (gethash tag tag-feeds-hash)))
          (puthash tag (list url) tag-feeds-hash)
          (push url (gethash tag tag-feeds-hash)))))
    tag-feeds-hash))

(defun my/write-elfeed-to-opml (filename)
  "Copy elfeed's feeds in FILENAME using OPML format specs.
Exclude feeds tied to local services."
  (with-temp-file filename
    (insert "<opml version=\"2.0\"><body>")
    (let* ((table (my/create-elfeed-tags-table)))
      (dolist (k (hash-table-keys table))
        (insert (concat "<outline title=\"" (symbol-name k) "\">"))
        (let* ((l (gethash k table)))
          (dolist (e l)
            (when (not (numberp (string-match-p "^\\(http[[:lower:]]?://localhost:[[:digit:]]*\\)" e)))
              (insert (concat "<outline xmlUrl=\"" e "\"/>")))))
        (insert "</outline>")))
    (insert "</body></opml>")))

;; This is what you need to parse your xml subscriptions file, hopefully you won't need it
;; (mapcar 'cdr (mapcar 'car (mapcar 'car (mapcar 'cdr (nthcdr 2 (car (nthcdr 2 (car (cdr (cdr (libxml-parse-xml-region 1 (buffer-size)))))))))))))

(add-hook 'kill-emacs-hook #'(my/write-elfeed-to-opml (concat my/user-home "Sync" my/path-separator "opml-feed.xml")))

(provide 'init-drd-newsfeed)
;;; init-drd-newsfeed.el ends here
