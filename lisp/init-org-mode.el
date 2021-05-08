(defun my/org-get-entry-time (pom &optional inherit)
  "Get the time as a time tuple, if there is none
returns nil."
  (let
      ((time (or (org-entry-get pom "TIMESTAMP" inherit)
                 (org-entry-get pom "SCHEDULED" inherit)
                 (org-entry-get pom "DEADLINE" inherit))))
    (when time
      (org-time-string-to-time time))))

;; The "unspecified" property tells a face to use the father value
(use-package org
  :config
  (custom-set-faces
   '(org-level-1 ((t (:inherit default :foreground "#cb4b16" :height unspecified))))
   '(org-level-2 ((t (:inherit default :foreground "#859900" :height unspecified))))
   '(org-level-3 ((t (:inherit default :foreground "#268bd2" :height unspecified))))
   '(org-level-4 ((t (:inherit default :foreground "#b58900" :height unspecified))))
   ;;'(variable-pitch ((t (:family "DejaVu Sans" :height 160)))))
   )
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 2.0))
  (define-key org-mode-map (kbd "C-c l") 'org-latex-preview))

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
(use-package org-habit
  :config
  (setq org-habit-graph-column 68))
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
                   (highlight-regexp "Urgenze\\|Eventi\\|Compleanni" 'org-warning))))
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
                                     (tags "+@event+TIMESTAMP<=\"<+6m>\""
                                           ((org-agenda-sorting-strategy '(timestamp-up))
                                            (org-agenda-overriding-header "Eventi futuri")))
                                     (agenda "" ((org-agenda-start-on-weekday nil)
                                                 (org-agenda-show-all-dates nil)))
                                     (tags "@birthday"
                                           ((org-agenda-sorting-strategy '(timestamp-up))
                                            (org-agenda-overriding-header "Compleanni futuri")
                                            (org-agenda-max-entries 6))))
                                    ((org-agenda-compact-blocks t))
                                    )))

;; org-capture templates
(setq org-capture-templates
      `(
        ;; Notice the backtick to enable quasiquoting for evaluating "concat" with "," before
        ;; setting it in the list
        ;; 1° Entry
        ("r" "Routine di varia natura (TODO + repeating SCHEDULE/DEADLINE/Timestamp)" entry
         (file+headline ,(concat my/user-org-files-directory "scheduled.org") "Routine")
         "* TODO %? :@routine:\n %^{Timestamp, SCHEDULED or DEADLINE?||SCHEDULED:|DEADLINE:} %^t\n")
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
        ;; 15° Entry
        ("b" "Aggiungi la data di compleanno di qualcuno che ti è caro" entry
         (file+headline ,(concat my/user-org-files-directory "scheduled.org") "Birthdays")
         "* TOWISH Compleanno %? :@birthday:\n %^t\n")
        ;; 16° Entry
        ("q" "Un nuovo progetto per la tua Bucket List" entry
         (file ,(concat my/user-org-files-directory "bucket.org"))
         "* TODO %?\n")
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
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks 'invisible)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-show-future-repeats 'next)
(setq org-habit-show-habits-only-for-today nil)
(setq org-deadline-warning-days 7)

(use-package htmlize :ensure t)

(global-set-key (kbd "C-c c") 'org-capture)

;; Break at column #60
(add-hook 'org-mode-hook '(lambda () (setq fill-column 60)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode)

(use-package org-edna :ensure t)
(org-edna-mode)

(use-package org-ref
  :ensure t
  :config
  ;;(setq org-ref-bibliography-notes ""
        ;;org-ref-default-bibliography ""
  ;;org-ref-pdf-directory "")
  )

;; Preserve org-src block indentation
(setq org-src-preserve-indentation nil
      org-edit-src-content-indentation 0)

(provide 'init-org-mode)
