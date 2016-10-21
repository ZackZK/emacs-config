;;璁剧疆瀛椾綋
;(set-default-font "-outline-Consolas-normal-i-normal-normal-*-*-96-96-c-*-iso10646-1")
;(set-default-font "-outline-Courier New-normal-r-normal-normal-*-*-96-96-c-*-iso8859-1")
;;(set-default-font "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1")
;;(set-default-font "-outline-Consolas-normal-i-normal-normal-*-*-96-96-c-*-iso8859-1")

;;(setq w32-charset-info-alist
;;    (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))
;;
;;(setq default-frame-alist
;;      (append
;;       '((font . "fontset-gbk")) default-frame-alist))
;;
;;(create-fontset-from-fontset-spec
;;  "-outline-Consolas-normal-normal-normal-mono-17-*-*-*-c-*-fontset-gbk")
;;(set-fontset-font
;; "fontset-default" nil
;; "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
;;(set-fontset-font
;; "fontset-gbk" 'kana
;; "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
;;(set-fontset-font
;; "fontset-gbk" 'han
;; "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
;;(set-fontset-font
;; "fontset-gbk" 'cjk-misc
;; "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
;;(set-fontset-font
;; "fontset-gbk" 'symbol
;; "-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1" nil 'prepend)
;;(set-default-font "fontset-gbk")
;;

;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 14")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 16)))

(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))
;;(increase-font-size)
(global-set-key (kbd "C-=") 'increase-font-size)

(global-set-key (kbd "C--") 'decrease-font-size)

(provide 'my-font-size)
