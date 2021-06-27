;;; package --- Summary
;;; Commentary:
;;; InitSplit installation and configuration
;;; Code:

;; NOTE, THIS PACKAGE STRAIGHT UP DOESN'T WORK AND IS UNMANTAINED

;; Load all custom files
(add-to-list 'load-path (concat user-emacs-directory "custom"))
;; (setq my/initsplit-custom-files
;;       (mapcar '(lambda (e) (substring e 18 nil))
;; 	      (file-expand-wildcards (concat user-emacs-directory "custom/custom*"))))
;; (dolist (e my/initsplit-custom-files)
;;   (load e))

;; File to custom associations map
;; Prefix for faster writing string args
(setq my/custom-prefix
      (concat user-emacs-directory "custom/custom-"))
;; REMEMBER TO ADD NEW ELEMENTS AS NECESSARY FOR NEW PACKAGES
(setq initsplit-customizations-alist
      `(("\\`aw-" ,(concat my/custom-prefix "ace-window.el"))
        ("\\`beacon-" ,(concat my/custom-prefix "beacon.el"))
        ("\\`\\(company\\|global-company\\)" ,(concat my/custom-prefix "company-mode.el"))
        ("\\`doom-modeline" ,(concat my/custom-prefix "doom-modeline.el"))
        ("\\`\\(dashboard\\|initial-buffer\\)" ,(concat my/custom-prefix "drdashboard.el"))
        ("\\`\\(auto-save-file\\|backup\\|before\\|custom-\\|delete-old\\|electric\\|gc-cons\\|undo-tree\\|history-del\\|indent-tabs\\|indicate\\|inhibit-startup\\|initial-scratch\\|kept-new\\|load-prefer\\|require\\|save\\|text-mode\\|vc-\\|version\\|warning\\)" ,(concat my/custom-prefix "drdefaults.el"))
        ("\\`\\(mail\\|message\\|notmuch\\|send\\)" ,(concat my/custom-prefix "drd-mail.el"))
        ("\\`elfeed" ,(concat my/custom-prefix "drd-newsfeed.el"))
        ("\\`\\(evil\\|global-evil\\)" ,(concat my/custom-prefix "evil-mode.el"))
        ("\\`\\(flycheck\\|global-flycheck\\)" ,(concat my/custom-prefix "flycheck.el"))
        ("\\`\\(mode-line\\|blink\\|column-nu\\|default-frame\\|global-hl\\|menu\\|midnight\\|server-after\\|show-paren\\|split\\|tool-bar\\|x-gtk\\)" ,(concat my/custom-prefix "gui.el"))
        ("\\`helm" ,(concat my/custom-prefix "helm.el"))
        ("\\`lsp" ,(concat my/custom-prefix "lsp.el"))
        ("\\`org-" ,(concat my/custom-prefix "org-mode.el"))
        ("\\`projectile" ,(concat my/custom-prefix "projectile.el"))
        ("\\`yas" ,(concat my/custom-prefix "yasnippet.el"))))
(require 'initsplit)

;; (use-package initsplit :ensure t)


(provide 'init-initsplit)
;;; init-split.el ends here
