;; change tabs to spaces when entering it
(setq-default indent-tabs-mode nil)
(setq default-tab-width 3)

;;from internet
;;禁用启动信息
(setq inhibit-startup-message t)

;;把title设置为“文件名"
(setq frame-title-format "%b")

;;设置默认工作目录
;;(setq default-directory "C:/USERS/") 
(setq default-directory "d:/Project") 

;;'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p) 

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;;显示日期
(setq display-time-day-and-date t)
(display-time)

;;显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; 代码折叠
(load-library "hideshow")
;(add-hook 'java-mode-hook 'hs-minor-mode)
;(add-hook 'perl-mode-hook 'hs-minor-mode)
;(add-hook 'php-mode-hook 'hs-minor-mode)
;(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;不显示工具栏 通过windows注册表实现
;;
;; Windows Registry Editor Version 5.00

;; [HKEY_CURRENT_USER\Software\GNU\Emacs]
;; "Emacs.Toolbar"="-1"
;; 隐藏滚动条，工具栏和菜单 emacs23使用nil来隐藏 (scroll-bar-mode nil)  
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)  

;;光标变细
(setq-default cursor-type 'bar)

;;自动载入修改过的文件
(global-auto-revert-mode t)

;(setq make-backup-files nil);不产生备份文件 


(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1))))

(global-set-key [C-right] 'geosoft-forward-word) 

;;(modify-syntax-entry ?_ "w" c-mode-syntax-table) 

(defun my_forward_word()
  (interactive)
  (while (progn (forward-word)
              (looking-at -)))
)

;;显示行号
(require 'linum)
;(global-linum-mode 1)

;;显示列#
(column-number-mode t)

;;击键100次自动保存
;(setq auto-save-interval 100)

(global-auto-revert-mode 1)

;;不产生备份文件
(setq make-backup-files nil)

;;高亮FIXME等
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords nil
;;                                     '(("\\<\\(FIXME\\)" 1 font-lock-warning-face prepend)
;;                                       ("\\<\\(and\\|or\\|not\\)\\>" .
;;                                        font-lock-keyword-face)))))

;; Highlight XXX style code tags in source files
(font-lock-add-keywords 'c-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))
(font-lock-add-keywords 'c++-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))
(font-lock-add-keywords 'latex-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))
(font-lock-add-keywords 'makefile-mode
 '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\)" 1 font-lock-warning-face prepend)))


(defun goto-paren ()
  "跳到匹配的括号"
  (interactive)
  (cond
   ((looking-at "[ \t]*[[\"({]") (forward-sexp))
    ((or (looking-at "[]\")}]") (looking-back "[]\")}][ \t]*")) (if (< (point) (point-max)) (forward-char)) (backward-sexp))
   (t (message "找不到匹配的括号"))))
(global-set-key "\C-]" 'goto-paren)

;;自动的在文件末增加一新行
(setq require-final-newline t)

;;高亮对应括号
(require 'highlight-parentheses)


;;最大化窗口
(w32-send-sys-command 61488)
;; Put the following at the end of .emacs
;; (defun w32-restore-frame ()
;; "Restore a minimized frame"
;; (interactive)
;; (w32-send-sys-command 61728))

;; (defun w32-maximize-frame ()
;; "Maximize the current frame"
;; (interactive)
;; (w32-send-sys-command 61488))

;; (w32-maximize-frame)
;; If minibuffer is too big, then in [HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs] add a new String Value EMACS.Toolbar = 0.


;;Replace all freakin' ^M chars in the current buffer
(defun remove-dos-eol ()
  "Removes the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(global-set-key "\C-cm" 'remove-dos-eol)
(add-hook 'text-mode-hook (lambda () (remove-dos-eol)))
;; log file to text mode
(setq auto-mode-alist (cons '("\\.log$" . text-mode) auto-mode-alist))


;; like vi %
;;(global-set-key "%" 'match-paren)

(defun match-paren (arg)
"Go to the matching paren if on a paren; otherwise insert %."
(interactive "p")
(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
((looking-at "\\s\)") (forward-char 1) (backward-list 1))
(t (self-insert-command (or arg 1))))) 


;; goto char
(defun wy-go-to-char (n char)
"Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
(interactive "p\ncGo to char: ")
(search-forward (string char) nil nil n)
(while (char-equal (read-char)
char)
(search-forward (string char) nil nil n))
(setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c a") 'wy-go-to-char) 

;; comment line
(defun run-current-file ()
(interactive)
(let (ext-map file-name file-ext prog-name cmd-str)
(setq ext-map
         '(
            ("py" . "python")
            ("sh" . "bash")
            ("htm" . "firefox")
            )
          );定义命令－文件类型映身表.
    (setq file-name (buffer-file-name));得到当前的buffer名
    (setq file-ext (file-name-extension file-name));得到后缀
    (setq prog-name (cdr (assoc file-ext ext-map))) ;根据后缀得到执行的命令，通过对ext-map的查找
    (setq cmd-str (concat prog-name " " file-name)) ;拼出一个命令
    (shell-command cmd-str)));执行

;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)

;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
        scroll-margin 3
        scroll-conservatively 10000)

(display-time-mode nil)

;; 打开ido模式
(ido-mode t)

(provide 'my-misc-conf)
