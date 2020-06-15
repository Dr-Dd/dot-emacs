
;; sensible window switching and moving with ace-window
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(provide 'init-ace-window)
