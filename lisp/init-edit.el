;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; 自定义两个函数
;; Faster move cursor
;; (defun next-ten-lines()
;;   "Move cursor to next 10 lines."
;;   (interactive)
;;   (next-line 10))

;; (defun previous-ten-lines()
;;   "Move cursor to previous 10 lines."
;;   (interactive)
;;   (previous-line 10))
;; ;; 绑定到快捷键
;; (global-set-key (kbd "M-n") 'next-ten-lines)            ; 光标向下移动 10 行
;; (global-set-key (kbd "M-p") 'previous-ten-lines)        ; 光标向上移动 10 行

;; (global-set-key (kbd "RET") 'newline-and-indent)


(use-package rg
  :ensure t
  :config
  (global-set-key (kbd "M-s M-s") 'rg)
  ;; win32平台解决rg.el无法正常搜索中文，在调用rg.exe前使用本地编码修改pattern
  (advice-add 'rg-run :around  
            (lambda (orig-fun &rest args)  
              (let ((pattern (car args)))  
                (apply orig-fun  
                       (encode-coding-string pattern locale-coding-system)  
                       (cdr args)))))
  )



(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))


	
(provide 'init-edit)

;;; init-edit ends here
