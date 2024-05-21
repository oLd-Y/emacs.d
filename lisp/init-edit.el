;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:


;; unbind default-indent-new-line(C-j) and electric-newline-and-maybe-indent(M-j)
(global-set-key (kbd "C-j") nil)
(global-set-key (kbd "M-j") nil)

;; set scroll up/down screen one line
(global-set-key (kbd "M-n")
                (lambda ()
                  (interactive)
                  (scroll-up-line 3)))
(global-set-key (kbd "M-p")
                (lambda ()
                  (interactive)
                  (scroll-down-line 3)))

(unless (package-installed-p 'color-rg)
  (package-vc-install "https://github.com/manateelazycat/color-rg"))

(use-package color-rg
  :ensure nil
  ;;:load-path "~/color-rg"
  :config
  (when (eq system-type 'windows-nt)
    (setq color-rg-command-prefix "powershell"))
  :bind
  ("C-c s i" . color-rg-search-input))

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))

(global-set-key (kbd "C-c b k") 'kill-this-buffer)


(use-package avy
  :ensure t
  :bind
  ("C-j" . avy-goto-char-timer)
  :custom
  (avy-timeout-seconds 0.3))



(use-package ace-pinyin
  :ensure t
  :demand nil
  :after avy
  :config
  (defun my/avy-goto-char-timer (&optional arg)
    (interactive "P")
    (let ((avy-all-windows (if arg
                               (not avy-all-windows)
                             avy-all-windows)))
      (avy-with avy-goto-char-timer
        (setq avy--old-cands (avy--read-candidates
                              'pinyinlib-build-regexp-string))
        (avy-process avy--old-cands)))))

(provide 'init-edit)

;;; init-edit ends here
