(use-package origami
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'origami-mode)
  (define-key origami-mode-map (kbd "C-c f") 'origami-toggle-node)
  (define-key origami-mode-map (kbd "C-u C-c f") 'origami-toggle-all-nodes)
  (define-key origami-mode-map (kbd "C-j") 'origami-next-fold)
  (define-key origami-mode-map (kbd "C-k") 'origami-previous-fold))

(provide 'init-origami)
