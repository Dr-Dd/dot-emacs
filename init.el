;;; package --- Summary
;;; Commentary:
;;; Just my init file
;;; Code:

;; Performance optimization
(setq read-process-output-max (* 1024 1024))

;; Enable debugging
;; (setq debug-on-error t)

;; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Melpa Stable
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; use-package first install
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; IN CASE OF A PACKAGE NOT INSTALLING, TRY TO RUN
;; <M-x>`package-refresh-contents`<RET> BEFORE DOING ANYTHING
;; STUPID

;; Add to emacs path custom libs
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
;; Libs to be loaded first
(require 'init-my-vars-and-funcs)
(require 'init-drdefaults)
(require 'init-flycheck)
(require 'init-diminish)
;; To test the startup time if something goes wrong
;;(require 'init-benchmark-init)

;; Other libs
(require 'init-org-mode)
(require 'init-evil-mode)
(require 'init-company-mode)
(require 'init-all-the-icons)
(require 'init-doom-modeline)
(require 'init-ace-window)
(require 'init-highlight-indent)
;; Mail
(require 'init-drd-mail)

;; Misc
;;(require 'init-smooth-scrolling)
;;(require 'init-drd-help)

;; Software Development
;;(require 'init-origami)
(require 'init-yasnippet)
(require 'init-helm)
;;(require 'init-treemacs)
;;(require 'init-projectile)
(require 'init-lsp)
(require 'init-drdashboard)
(require 'init-doom-themes)
(require 'init-fonts)
(require 'init-gui)

;;; init.el ends here
