;; ;;; vfp-mode.el --- Major mode for Visual FoxPro scripting

;; ;; Author: Your Name
;; ;; Version: 1.0

;; ;; 定义关键字
;; (defvar vfp-keywords
;;   '("SELECT" "FROM" "WHERE" "INSERT" "INTO" "UPDATE" "DELETE" "ORDER" "BY" "IF" "ENDIF" "ELSE" "DO" "WHILE" "ENDDO" "FOR" "TO" "NEXT" "FUNCTION" "RETURN" "PROCEDURE" "PUBLIC" "PRIVATE" "LOCAL" "SET" "GO" "TOP")
;;   "Visual FoxPro keywords.")

;; ;; 定义关键字的正则表达式模式
;; (defvar vfp-keywords-regexp (regexp-opt vfp-keywords 'words))

;; ;; 设置 syntax table
;; (defvar vfp-mode-syntax-table
;;   (let ((st (make-syntax-table)))
;;     ;; 添加注释定义 '!' 是注释开始符号
;;     (modify-syntax-entry ?\! "<" st)
;;     (modify-syntax-entry ?\n ">" st)
;;     st)
;;   "Syntax table for `vfp-mode'.")

;; ;; 定义语法高亮
;; (defvar vfp-font-lock-keywords
;;   (let ((keyword-regexp (regexp-opt vfp-keywords 'words)))
;;     `((,keyword-regexp . font-lock-keyword-face)))
;;   "Highlighting expressions for VFP mode")

;; ;; 定义 mode 函数
;; (define-derived-mode vfp-mode fundamental-mode "VFP"
;;   "Major mode for editing Visual FoxPro scripts."
;;   :syntax-table vfp-mode-syntax-table
;;   ;; 代码高亮
;;   (setq font-lock-defaults '(vfp-font-lock-keywords))
;;   ;; 确保 font-lock-mode 被激活
;;   (font-lock-mode 1));; 定义语法高亮

;; ;; 添加 mode 到 features 列表
;; (provide 'vfp-mode)

;; ;;; vfp-mode.el ends here
;;; vfp-mode.el --- Major mode for Visual FoxPro scripting

;; Author: Your Name
;; Version: 1.0

;;;###autoload
(define-derived-mode vfp-mode prog-mode "VFP"
  "Major mode for editing Visual FoxPro scripts."

  ;; Set local variables
  (setq-local font-lock-defaults
              `(,vfp-font-lock-keywords
                nil nil nil nil))

  ;; Syntax table
  (setq-local syntax-propertize-function
              vfp-syntax-propertize-function)

  ;; Comment syntax
  (setq-local comment-start "!")
  (setq-local comment-start-skip "!+\\s-*")

  ;; Indentation settings (if needed)
  ;; (setq-local indent-line-function #'vfp-indent-line-function)

  ;; Code for additional syntax highlighting rules can go here

  ;; This is where you'd add any additional setup, such as:
  ;; - imenu integration
  ;; - code folding support
  ;; - other local variables pertinent to VFP
)

;; 定义关键字
(defvar vfp-keywords
  '("SELECT" "FROM" "WHERE" "INSERT" "INTO" "UPDATE" "DELETE" "ORDER" "BY" "IF" "ENDIF" "ELSE" "DO" "WHILE" "ENDDO" "FOR" "TO" "NEXT" "FUNCTION" "RETURN" "PROCEDURE" "PUBLIC" "PRIVATE" "LOCAL" "SET" "GO" "TOP")
  "Visual FoxPro keywords.")

;; 定义关键字的正则表达式模式
(defvar vfp-keywords-regexp (regexp-opt vfp-keywords 'words))

;; 设置 syntax table
(defvar vfp-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; 添加注释定义 '!' 是注释开始符号
    (modify-syntax-entry ?! "<" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for `vfp-mode'.")

;; 定义语法高亮
(defvar vfp-font-lock-keywords
  `((,vfp-keywords-regexp . font-lock-keyword-face))
  "Highlighting expressions for VFP mode")

;; 确保 font-lock-mode 被激活
(add-hook 'vfp-mode-hook (lambda () (font-lock-mode 1)))

;; 添加 mode 到 features 列表
(provide 'vfp-mode)

;;; vfp-mode.el ends here
