;; Windows Ctrl-space被输入法切换占用，使用Ctrl-l快捷键
(global-set-key (kbd "C-l") 'set-mark-command)

;;快速跳转到指定行
(global-set-key (kbd "C-x g") 'goto-line)

;;替换字符串快捷键
(global-set-key (kbd "C-o") 'replace-string)
