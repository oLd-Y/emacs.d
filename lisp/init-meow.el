;;; init-meow.el  --- Custom configuration
;;; Commentary:
;;; Code:

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
   ;; '("<escape>" . ignore)
   ;; notice that do not set a keybinding for ESC, e.g '("ESC" . meow-last-buffer), other wise some keybinding will be lost
   '("<escape>" . meow-last-buffer)))

(use-package meow
  :ensure t
  :config
  (meow-setup)
  ;; C-[ exit insert mode
  (when window-system
    (define-key input-decode-map (kbd "C-[") [control-bracketleft])
    (define-key meow-insert-state-keymap [control-bracketleft] 'meow-insert-exit))

  ;; (meow-thing-register 'org-md-block
  ;;                      '(regexp "^[ \\|\t]*\\(#\\+begin_\\|```\\)[^\n]*\n" "^[ \\|\t]*\\(#\\+end_[^\n]*\\|```\\)$")
  ;;                      '(regexp "^[ \\|\t]*\\(#\\+begin_\\|```\\)[^\n]*\n" "^[ \\|\t]*\\(#\\+end_[^\n]*\\|```\\)$")
  ;;                      )
  ;; (add-to-list 'meow-char-thing-table '(?o . org-source-block))

  (meow-global-mode 1)
  ;; 失去焦点时，退出 insert mode。
  ;;(add-hook 'focus-out-hook 'meow-insert-exit)
  ;; 延长数字显示时间
  (setq meow-expand-hint-remove-delay 3))




(use-package rime
  :ensure t
  :config
  (setq rime-disable-predicates '(meow-normal-mode-p
                                  meow-keypad-mode-p
                                  meow-motion-mode-p
                                  meow-beacon-mode-p
				  rime-predicate-space-after-cc-p
				  rime-predicate-after-alphabet-char-p
				  rime-predicate-prog-in-code-p
				  rime-predicate-after-ascii-char-p
				  rime-predicate-ace-window-p))
  (set-face-attribute 'rime-default-face nil :foreground "#839496" :background "#073642")

  :custom

  (default-input-method "rime")
  (rime-share-data-dir "~/.local/share/fcitx5/rime")
  (rime-user-data-dir "~/.emacs.d/rime")
  (rime-show-candidate nil)
  (rime-show-candidate 'posframe)
  (rime-posframe-properties
   (list :background-color "#073642"
         :foreground-color "#839496"
         :internal-border-width 1))
  )



(provide 'init-meow)
;;; init-meow.el ends here
