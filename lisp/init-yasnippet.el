;;; package --- Summary
;;; Commentary:
;;; snippets expansion via yasnippet
;;; Code:

(use-package yasnippet
  :defer t
  :ensure t)

(use-package yasnippet-snippets
  :defer t
  :ensure t
  :after (yasnippet)
  :config
  (yas-reload-all)
  (diminish 'yas-minor-mode)
  :bind (:map yas-minor-mode-map
              ([tab] . nil)
              ("M-p" . yas-expand)
              ("M-i" . yas-insert-snippet)))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
