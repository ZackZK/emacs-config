(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 函数在选中的region前后两行插入 {% hightlight {lanauage} %} ... {% endhighlight %}
(defun markdown-insert-highlight (code) 
  (interactive "MSource code type(bash, java...):")

  ;; 先插入 endhighlight
  (goto-char (region-end))
  (if (equal (region-end) (line-beginning-position)) ;region-end在行首和行中的处理
      (insert "{\% endhighlight \%}\n")
    (progn (end-of-line)
     (insert "\n{\% endhighlight \%}")))
  
  ;; 再插入 hightlight
  (goto-char (region-beginning))
  (beginning-of-line)
  (insert "{% highlight " code "%}\n" )
  )

 (add-hook 'markdown-mode-hook
            (lambda () (local-set-key (kbd "C-x i") 'markdown-insert-highlight)))

(provide 'markdown-config)
