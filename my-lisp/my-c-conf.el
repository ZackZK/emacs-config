;;
;; C and C++ mode settings. The default setting ("GNU indentation style")
;; actually makes it quite hard to write in the recommended NTC style.
;; The "BSD" style setting makes C mode quite compatible with it.
;;
;; THESE ARE FOR EMACS 19.30 where the customization stuff changed a bit
;; relative to earlier versions.
;;
(setq c-mode-hook
      '(lambda ()
	 (c-set-style "BSD")
	 ;;
	 ;; Change this you you want a different basic indentation step.
	 ;;
	 (setq c-basic-offset 4)
	 ;;
	 ;; The next 2 calls invert the normal c-mode meanings
	 ;; of LF and CR. They make CR automatically indent
	 ;; the next line. Remove them if you do not like that.
	 ;;
	 (define-key c-mode-map "\r" 'newline-and-indent)
	 (define-key c-mode-map "\n" 'newline) ; newline = C-j

	 (setq case-fold-search nil) ; C is case-sensitive
	 ))
;;
;;
;; Similar settings for C++ -mode.
;;
(setq c++-mode-hook
      '(lambda ()
	 (c-set-style "BSD")
	 (setq c-basic-offset 4)

	 (define-key c++-mode-map "\r" 'newline-and-indent)
	 (define-key c++-mode-map "\n" 'newline) ; newline = C-j

	 (setq case-fold-search nil) ; C++ is case-sensitive
	 ))
;;
;;

;; comment line
(defun comment-line()
  (interactive)
  (save-excursion)
  (setq beg (line-beginning-position))
  (setq end (line-end-position))
  (comment-region beg end)
  )

(global-set-key (kbd "C-c c") 'comment-line)

(add-hook 'c-mode-hook 'hs-minor-mode)

(add-to-list 'auto-mode-alist '("\\.c\\(?:d[lt]\\|li\\|pd\\|st\\)$" . c-mode))

(provide 'my-c-conf)
