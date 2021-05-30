;;; package --- Summary
;;; Commentary:
;;; Company mode for _in buffer_ completion (not minibuffer like helm)
;;; Code:

;; company-mode autocompletion
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook  'global-company-mode)
  (diminish 'company-mode)
  ;; keybindings
  :bind
  (:map global-map
        ("C-<SPC>" . company-complete)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-h") #'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<backtab>") #'company-select-previous) )


(use-package company-c-headers
  :ensure t
  :after (company)
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-lsp :ensure t
  :after (lsp company)
  :config
  (push 'company-lsp company-backends))

;; obsolete, superseded by company-box and company-posframe
;; but still the best option out of the bunch
;;(use-package company-quickhelp :ensure t
  ;;:after (company)
  ;;:config
  ;;(company-quickhelp-mode)
  ;;(setq company-quickhelp-max-lines 13)
  ;;(setq company-quickhelp-delay 0.2)
  ;;;;(setq company-quickhelp-use-propertized-text t)
  ;;;; Parameter for developing purposes
  ;;;; (set-face-attribute 'company-quickhelp-face nil :height 160)
  ;;)

;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-box-doc-enable nil)
;;   (setq company-box-doc-delay 0.2)
;;   (add-to-list 'company-box-doc-frame-parameters '(font . "Inconsolata-16")))

;; (use-package company-posframe :ensure t
;;   :config
;;   (setq company-posframe-quickhelp-timer 0.2)
;;   (setq company-pos)
;;   (company-posframe-mode 1))

(use-package helm-company
  :ensure t
  :config
  (define-key company-mode-map (kbd "C-:") 'helm-company)
  (define-key company-active-map (kbd "C-:") 'helm-company))

(provide 'init-company-mode)

;;; init-company-mode.el ends here
