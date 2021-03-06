;TAB 
(require 'tabbar)
(tabbar-mode)
;(setq tabbar-buffer-groups-function
;(lambda (buffer)
;(list "All buffers")))

(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)

(defun tabbar-buffer-ignore-groups (buffer)
  "Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Process")
      )
     ((member (buffer-name)
              '("*scratch*" "*Messages*"))
      '("Common")
      )
     ((eq major-mode 'dired-mode)
      '("Dired")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      '("Help")
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      '("Mail")
      )
     (t
      (list
       "default" ;; no-grouping
       (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
           mode-name
         (symbol-name major-mode)))
      )

     )))

(global-set-key (kbd "M-[") 'tabbar-backward-group)
(global-set-key (kbd "M-]") 'tabbar-forward-group)
(global-set-key (kbd "M-p") 'tabbar-backward-tab)
(global-set-key (kbd "M-n") 'tabbar-forward-tab)
(global-set-key [(control tab)] 'tabbar-forward-tab)

(provide 'my-tabbar-conf)
