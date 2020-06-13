;; snippets expansion via yasnippet
(use-package yasnippet
  :ensure t)
(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet)
  :config
  (yas-global-mode 1)
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; keybindings
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "M-p") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "M-i") 'yas-insert-snippet))
;; == end of yasnippet ==


(provide 'init-yasnippet)
