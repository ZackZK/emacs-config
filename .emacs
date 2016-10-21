;; -*- Emacs-Lisp -*-

(put 'eval-expression 'disabled nil) ; Enable command "ESC :".
(setq require-final-newline t) ; Makes sure the last line is terminated.
(setq auto-save-interval 1000) ; Do not auto-save too often.

;;
;; Set mouse-select color
;;
(set-face-background 'region' "SlateGray")
(set-face-foreground 'region' "white")
(set-face-background 'highlight' "DarkSlateBlue")
(set-face-foreground 'highlight' "white")
;;
;; End of Mouse colour selections
;;


;; Printer configurations, uncomment and change these to the proper
;; values of your site
;;
; (setq ntemacs-print-server-name "ServerNameNotSet")
; (setq ntemacs-printer-name "PrinterNameNotSet")
;;
;;
;;; End of orig.emacs

;; 加载路径
(setq load-path (cons "~/my-lisp" load-path))
(setq load-path (cons "~/my-lisp/3rd-lisp" load-path))
(setq load-path (cons "~/my-lisp/3rd-lisp/language-mode" load-path))


(require 'my-font-size)
(require 'my-like-ultraedit-conf)
(require 'my-misc-conf)
(require 'my-tabbar-conf)
(require 'my-c-conf)
(require 'my-python-conf)
(require 'my-keybind)
(require 'my-org-mode)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(ido-mode t)
(require 'linum)
(column-number-mode t)

(add-to-list 'custom-theme-load-path "~/my-lisp/3rd-lisp/theme")
(load-theme 'zenburn t)

;;(require 'markdown-mode)
(global-set-key (kbd "C-l") 'set-mark-command)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-o") 'replace-string)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'chinese-gbk);;设置文件名编码
(setq path-name-coding-system 'chinese-gbk);;设置目录路径名编码

(require 'markdown-config)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(server-start)



