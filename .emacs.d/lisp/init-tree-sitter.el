;;; package --- Summary
;;; Commentary:
;;; Tree sitter as a fontlock substitute
;;; Code:

(use-package tree-sitter-langs
  :ensure t)
(use-package tree-sitter
  :ensure t
  :config
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(provide 'init-tree-sitter)
;;; init-tree-sitter.el ends here
