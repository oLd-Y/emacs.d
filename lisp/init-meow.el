;;; init-meow.el  --- Custom configuration
;;; Commentary


(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . meow-last-buffer)))



(use-package meow
  :ensure t
  :config
  ;; (define-key meow-insert-state-keymap (kbd "<escape>") #'meow-insert-exit)
  (meow-setup)
  (meow-global-mode 1)
  ;; 失去焦点时，退出 insert mode。
  ;;(add-hook 'focus-out-hook 'meow-insert-exit)
  ;; 延长数字显示时间
  (setq meow-expand-hint-remove-delay 3))


(use-package sis
  :ensure t
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config
  (sis-ism-lazyman-config "1033" "2052" 'im-select)
  ;;(sis-ism-lazyman-config nil t 'w32)
  (add-hook 'meow-insert-exit-hook #'sis-set-english)
  (add-to-list 'sis-context-hooks 'meow-insert-enter-hook)
  
  (setq sis-default-cursor-color "green yellow" ; 英文光标色
   	sis-other-cursor-color "#FF2121") ; 中文光标色
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t))

;; (use-package sis
;;   :init
;;   ;; `C-s/r' 默认优先使用英文 必须在 sis-global-respect-mode 前配置
;;   (setq sis-respect-go-english-triggers
;; 	(list 'isearch-forward 'isearch-backward) ; isearch-forward 命令时默认进入en
;; 	sis-respect-restore-triggers
;; 	(list 'isearch-exit 'isearch-abort)) ; isearch-forward 恢复, isearch-exit `<Enter>', isearch-abor `C-g'
;;   :config
;;   (sis-ism-lazyman-config "1033" "2052" 'im-select) ; 输入码 1033/英文，2052/中文小狼毫
;;   ;; enable the /cursor color/ mode 中英文光标颜色模式
;;   (sis-global-cursor-color-mode t)
;;   ;; enable the /respect/ mode buffer 输入法状态记忆模式
;;   (sis-global-respect-mode t)
;;   ;; enable the /follow context/ mode for all buffers
;;   (sis-global-follow-context-mode t)
;;   ;; enable the /inline english/ mode for all buffers
;;   (sis-global-inline-mode t) ; 中文输入法状态下，中文后<spc>自动切换英文，结束后自动切回中文
;;   ;; (global-set-key (kbd "<f9>") 'sis-log-mode) ; 开启日志
;;   ;; 特殊定制
;;   (setq sis-default-cursor-color "green yellow" ; 英文光标色
;;    	sis-other-cursor-color "#FF2121" ; 中文光标色
;;   	;; sis-inline-tighten-head-rule 'all ; 删除头部空格，默认1，删除一个空格，1/0/'all
;; 	sis-inline-tighten-tail-rule 'all ; 删除尾部空格，默认1，删除一个空格，1/0/'all
;; 	sis-inline-with-english t ; 默认是t, 中文context下输入<spc>进入内联英文
;; 	sis-inline-with-other t) ; 默认是nil，而且prog-mode不建议开启, 英文context下输入<spc><spc>进行内联中文
;;   ;; 特殊buffer禁用sis前缀,使用Emacs原生快捷键  setqsis-prefix-override-buffer-disable-predicates
;;   (setq sis-prefix-override-buffer-disable-predicates
;; 	(list 'minibufferp
;; 	      (lambda (buffer) ; magit revision magit的keymap是基于text property的，优先级比sis更高。进入 magit 后，disable sis的映射
;; 		(sis--string-match-p "^magit-revision:" (buffer-name buffer)))
;; 	      (lambda (buffer) ; special buffer，所有*打头的buffer，但是不包括*Scratch* *New, *About GNU等buffer
;; 		(and (sis--string-match-p "^\*" (buffer-name buffer))
;; 		     (not (sis--string-match-p "^\*About GNU Emacs" (buffer-name buffer))) ; *About GNU Emacs" 仍可使用 C-h/C-x/C-c 前缀
;; 		     (not (sis--string-match-p "^\*New" (buffer-name buffer)))
;; 		     (not (sis--string-match-p "^\*Scratch" (buffer-name buffer))))))) ; *Scratch*  仍可使用 C-h/C-x/C-c 前缀
;;   )

(provide 'init-meow)
;;; init-meow.el ends here
