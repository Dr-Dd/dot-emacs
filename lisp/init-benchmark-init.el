(cl-letf (((symbol-function 'define-obsolete-function-alias) #'defalias))
  (use-package benchmark-init
    :config
    (require 'benchmark-init-modes)                                     ; explicitly required
    (add-hook 'after-init-hook #'benchmark-init/deactivate)))
;; benchmark init
;;(use-package benchmark-init
  ;;:ensure t
  ;;:config
  ;; To disable collection of benchmark data after init is done.
  ;;(add-hook 'after-init-hook 'benchmark-init/deactivate))

(provide 'init-benchmark-init)
;; init-benchmark-init.el ends here
