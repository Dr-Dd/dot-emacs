
(put 'lsp-treemacs-errors-list :advertised-binding [?\C-c ?e ?t])
(defun my/help-window nil
  "Print all your most important keybindings in a help buffer"
  (interactive)
  ;;(describe-function 'my/help-window)
  (with-help-window
      "*drd-help*"
    (princ (substitute-command-keys
  "These are your keybindings:

- Refactoring (lsp-mode/xref)\\<lsp-mode-map>
`\\[lsp-execute-code-action]'\tSearch code action to execute
`\\[xref-find-references]'\tFind all file references inside the file

- Error checking: (flycheck/lsp-treemacs)\\<flycheck-mode-map>
`\\[flycheck-next-error]'\tNext Error
`\\[flycheck-previous-error]'\tPrevious Error
`\\[flycheck-list-errors]'\tLocal Error List
\\<lsp-mode-map>`\\[lsp-treemacs-errors-list]'\tProject Errors List

- Snippet expansion: (yasnippet)\\<yas-minor-mode-map>
`\\[yas-expand]'\tExpand Snippet
`\\[yas-insert-snippet]'\tSearch for Snippet

- Docs: (lsp-mode/xref)
`\\[xref-find-definitions]'\tFollow link to definition
\\<lsp-mode-map>`\\[lsp-describe-thing-at-point]'\tShow documentation at point
Also, company-lsp, company-quickhelp and company-capf provide
tooltip description of possible completions

- Auto-completions: (company-mode)\\<company-mode-map>
`\\[company-complete]'\t\tShow Completion Candidates
\\<company-active-map>`\\[company-select-next]'\t\tCycle completions forward
`\\[company-select-previous]'\tCycle completions backwards
`\\[company-abort]'\t\tAbort active completion

- Git: (magit)\\<magit-mode-map>
`\\[magit-status]'\tMagit Status

- Projects navigation: (treemacs/origami)
`\\[treemacs]'\t\tToggle Projects Tree
`\\[treemacs-select-window]'\t\tFocus File-Tree
\\<origami-mode-map>`\\[origami-toggle-node]'\t\tToggle fold
`\\[origami-toggle-all-nodes]'\tToggle ALL folds
`\\[origami-next-fold]'\t\tGo to next fold
`\\[origami-previous-fold]'\t\tGo to previous fold

- Projects management: (projectile)\\<projectile-mode-map>
`\\[projectile-switch-project]'\tOpen/Switch Project
`\\[projectile-find-file]'\tFind file in project
`\\[projectile-replace]'\tReplace string in Project
Notice how this is NOT used by lsp-mode if not for finding
a project root, the projects are actually handled by lsp
workspaces

- Misc
`\\[my/toggle-theme]'\tToggle light/dark theme"
))))

(provide 'init-drd-help)
