(defun my/org-get-entry-time (pom &optional inherit)
  "Get the time as a time tuple, if there is none
returns nil."
  (let
      ((time (or (org-entry-get pom "TIMESTAMP" inherit)
                 (org-entry-get pom "SCHEDULED" inherit)
                 (org-entry-get pom "DEADLINE" inherit))))
    (when time
      (org-time-string-to-time time))))

;; Here we could also use quasiquoting with a backtick, like this
;;                    `(,my/user-org-files-directory)
;;                    ^ ^~~~The "," means "eval before pushing onto the list"
;;                    ^~~~The "`" means "enable ',' matching"
(setq org-agenda-files (list my/user-org-files-directory))

;; org-mode
;; Knuth shuffle algorithm to use for randomizing the "x" agenda (see below)
;; -------------------------------------------------------------------------
;; To shuffle an array a of n elements (indices 0..n-1):
;; for i from n−1 downto 1 do
;;      j ← random integer such that 0 ≤ j ≤ i
;;      exchange a[j] and a[i]
;; org-modules
(require 'org-habit)
(setq org-habit-graph-column 68)
;; custom workflow keywords
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "|" "CANCELED")))
(setq org-todo-keyword-faces
      '(("CANCELED" . "black")
        ("TOLISTEN" . "gold2")
        ("TOREAD" . "gold2")
        ("TOMIX" . "gold2")))
(add-hook 'org-agenda-finalize-hook
          (lambda ()
            (progn (highlight-regexp "\<[A-z]* [0-9]*\>" 'org-date)
                   (highlight-regexp "Urgenze\\|Eventi" 'org-warning))))
;; org-mode agenda files
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-prefix-format '(
                                 ;; to override default values, comment out the line and edit it
                                 (agenda . " %i %-12:c%?-12t% s") ;; default
                                 (todo . " %i %-12:c") ;; default
                                 ;;(tags . " %i %-12:c") ;; default
                                 (tags . " %-9(let ((timestamp (my/org-get-entry-time (point)))) (if timestamp (format-time-string \"<%b %d>\" timestamp) \"\"))" )
                                 (search . " %i %-12:c") ;; default
                                 ))
(setq org-agenda-custom-commands '(("d" "Weekly agenda about urgencies"
                                    ((tags "@urgent"
                                           ((org-agenda-sorting-strategy '(timestamp-up))
                                            (org-agenda-overriding-header "Urgenze da portare a termine")))
                                     (tags "@event"
                                           ((org-agenda-sorting-strategy '(timestamp-up))
                                            (org-agenda-overriding-header "Eventi futuri")))
                                     (agenda "" ((org-agenda-start-on-weekday nil))))
                                    ((org-agenda-compact-blocks t)))))

;; org-capture templates
(setq org-capture-templates
      `(
        ;; Notice the backtick to enable quasiquoting for evaluating "concat" with "," before
        ;; setting it in the list
        ;; 1° Entry
        ("r" "Routine di varia natura (TODO + repeating SCHEDULE/DEADLINE/Timestamp)" entry
         (file+headline ,(concat my/user-org-files-directory "scheduled.org") "Routine")
         "* TODO %? :@routine:\n %^{Timestamp, SCHEDULE or DEADLINE?||SCHEDULE:|DEADLINE:} %^t\n")
        ;; 2° Entry
        ("e" "Eventi di varia importanza (Unset/[#A/B/C] + Timestamp)" entry
         (file+headline ,(concat my/user-org-files-directory "scheduled.org") "Calendar")
         "* FUTURE %^{_ or [#A/B/C]?||[#A]|[#B]|[#C]} %? :@event:\n %^t\n")
        ;; 3° Entry
        ("p" "Progetti da iniziare a ragionare" entry
         (file ,(concat my/user-org-files-directory "projects.org"))
         "* TODO %? %^{@urgent or @utility?|:@urgent:|:@utility:}\n")
        ;; 5° Entry
        ("s" "Lista della spesa per cibo mancante" entry
         (file ,(concat my/user-org-files-directory "lista-spesa.org"))
         "* TOBUY %?\n")
        ;; 6° Entry
        ("f" "Film da vedere" entry
         (file ,(concat my/user-org-files-directory "movies.org"))
         "* TOWATCH %?\n")
        ;; 7° Entry
        ("l" "Libri da leggere" entry
         (file ,(concat my/user-org-files-directory "books.org"))
         "* TOBUY %?\n")
        ;; 9° Entry
        ("i" "Progetti informatici personali (TODO)" entry
         (file ,(concat my/user-org-files-directory "compsci.org"))
         "* TODO %?\n")
        ;; 10° Entry
        ("m" "Album Musicali da ascoltare" entry
         (file+headline ,(concat my/user-org-files-directory "music.org") "Albums")
         "* TOBUY %? :@album:\n")
        ;; 11° Entry
        ("M" "Bei pezzi da ricordare" entry
         (file+headline ,(concat my/user-org-files-directory "music.org") "Mix")
         "* %? :@mix:\n")
        ;; 13° Entry
        ("h" "Passatempo di varia natura" entry
         (file ,(concat my/user-org-files-directory "hobbies.org"))
         "* TODO %? :_editme:\n")
        ;; 14° Entry
        ("c" "File da riordinare/riorganizzare" entry
         (file ,(concat my/user-org-files-directory "to-capture.org"))
         "* TOCAPTURE %?\n")
        ))
;; set org-mode to memorize done time
(setq org-log-done 'time)
(setq org-tags-column 0)

;; org bullets
(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (shell . t)
   (emacs-lisp . nil)))

(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org-mode)
