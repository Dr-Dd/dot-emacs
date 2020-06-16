
(put 'lsp-treemacs-errors-list :advertised-binding [?\C-c ?e ?t])
(defun my/help-window nil
  "Print all your most important keybindings in a help buffer"
  (interactive)
  ;;(describe-function 'my/help-window)
  (with-help-window
      "*drd-help*"
    (princ (substitute-command-keys
  "These are your keybindings:

- Refactoring (lsp-mode/*)\\<lsp-mode-map>
`\\[lsp-execute-code-action]'\tSearch code action to execute
`\\[lsp-find-references]'\tFind all file references inside the file

- Error checking: (flycheck/lsp-treemacs)\\<flycheck-mode-map>
`\\[flycheck-next-error]'\tNext Error
`\\[flycheck-previous-error]'\tPrevious Error
`\\[flycheck-list-errors]'\tLocal Error List
\\<lsp-mode-map>`\\[lsp-treemacs-errors-list]'\tProject Errors List

- Snippet expansion: (yasnippet)\\<yas-minor-mode-map>
`\\[yas-expand]'\tExpand Snippet
`\\[yas-insert-snippet]'\t\tSearch for Snippet

- Docs: (lsp-mode)\\<lsp-mode-map>
`\\[lsp-find-definition]'\tFollow link to definition
`\\[lsp-describe-thing-at-point]'\tShow documentation at point
Also, company-lsp, company-quickhelp and company-capf provide
tooltip description of possible completions

- Auto-completions: (company-mode)\\<company-mode-map>
`\\[company-complete]'\t\tShow Completion Candidates
\\<company-active-map>`\\[company-select-next-or-abort]'\t\tCycle completions forward
`\\[company-select-previous-or-abort]'\tCycle completions backwards
`\\[company-abort]'\t\tAbort active completion

- Git: (magit)\\<magit-mode-map>
`\\[magit-status]'\tMagit Status

- Projects navigation: (treemacs)
`\\[treemacs]'\tToggle Projects Tree
`\\[treemacs-select-window]'\tFocus File-Tree

- Projects management: (projectile)\\<projectile-mode-map>
`\\[projectile-switch-project]'\tOpen/Switch Project
`\\[projectile-find-file]'\tFind file in project
`\\[projectile-replace]'\tReplace string in Project
Notice how this is NOT used by lsp-mode if not for finding
a project root, the projects are actually handled by lsp
workspaces"
))))

(provide 'init-drd-help)
