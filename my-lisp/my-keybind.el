;; my keybind
(define-key global-map [f9] 'other-window)
(define-key global-map [f6] 'ff-find-other-file)

;;显示行号
;;(global-set-key [f8] 'linum-mode)
(global-set-key [F5] 'call-last-kbd-macro)

;几个方便的快捷键绑定（王春宇）

;M-1 相当于最大化一个 buffer , 默认的 key bind 是 C-x 1 。
;M-4 相当于关闭一个 buffer , 默认的 key bind 是 C-x k 。
;M-0 相当于跳转到两个 buffer 中的另一个，默认的 key bind 是 C-x 0 。
;M-5 可以显示 buffer 的完整的文件名称。
(defun display-buffer-name ()
  (interactive)
  (message (buffer-file-name (current-buffer))))
(global-set-key (kbd "M-4") 'kill-this-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'other-window)
(global-set-key (kbd "M-5") 'display-buffer-name)
(global-set-key (kbd "C-x f") 'find-file-at-point)

(global-set-key [f7] 'compile)

(global-unset-key [f4])
(global-unset-key [C-f4])
(global-set-key [C-f4] 'previous-error)
(global-set-key [f4] 'next-error)

(defun open_my_favoriate_file()
  (interactive)
  (find-file "d:/k5zhang/notes/todo_list.org"))
(global-set-key [f5] 'open_my_favoriate_file)

(define-key global-map "\C-x\g" 'goto-line)

;; 快速拷贝一整行
(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (save-excursion)

  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end)))))
(define-key global-map "\C-x\c" 'quick-copy-line)

(provide 'my-keybind)
