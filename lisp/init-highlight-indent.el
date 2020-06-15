
;; highlight indentation
(use-package highlight-indentation
  :ensure t
  :config
  (set-face-background 'highlight-indentation-face "#CCCCCC")
  (set-face-background 'highlight-indentation-current-column-face "#999999")
  (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
  (diminish 'highlight-indentation-current-column-mode))

(provide 'init-highlight-indent)
