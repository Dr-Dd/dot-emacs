(use-package diminish
  :ensure t
  :config
  (eval-after-load "filladapt" '(diminish 'filladapt-mode)))


(provide 'init-diminish)
