;; benchmark init
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))
;; == end of benchmark init ==

(provide 'init-benchmark-init)
