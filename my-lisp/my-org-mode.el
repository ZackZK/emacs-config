(defun my-org-mode-config ()
  ; Org-mode settings
  (local-set-key "\C-cl" 'org-store-link)
  (local-set-key "\C-ca" 'org-agenda)
  (global-font-lock-mode 1)
  (setq org-hide-leading-stars t)
  (setq org-cycle-include-plain-lists t)
  )

;; add to hook
(add-hook 'org-mode-hook 'my-org-mode-config)

(provide 'my-org-mode)
