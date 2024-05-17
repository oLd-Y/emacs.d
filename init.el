;;; init.el --- The main entry for emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:



(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path	(expand-file-name "site-lisp" user-emacs-directory))

;; (add-to-list 'load-path (expand-file-name "lsp-bridge" "~/")) ; lsp-bridge 的路径
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;; change the encoding system of windows
(when (eq system-type 'windows-nt)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(undecided-dos . windows-1250)))



;; (setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触

;; (setq pixel-scroll-precision-mode t)
(visual-line-mode t)
(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份
(setq visible-bell t)
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
;; (global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存


;; set proxy
(setq url-proxy-services '(("no_proxy" . "^\\(192\\.168\\..*\\)")
                           ("http" . "127.0.0.1:7890")
			   ("https" . "127.0.0.1:7890")))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; 不加这一句可能有问题，建议读者尝试一下




(global-set-key (kbd "C-j") nil)
;; 删去光标所在行（在图形界面时可以用 "C-S-<DEL>"，终端常会拦截这个按法)
(global-set-key (kbd "C-j C-k") 'kill-whole-line)
(setopt use-short-answers t)   ;; Since Emacs 29, `yes-or-no-p' will use `y-or-n-p'


; TODO 
(setq package-check-signature nil)

(require 'init-package)
(require 'init-ui)
(require 'init-yas)
(require 'init-minibuffer)
(require 'init-org)
(require 'init-edit)
(require 'init-text)
(require 'init-completion)
(require 'init-treesit)
(require 'init-meow)



;; (use-package hydra
;;   :ensure t)

;; (use-package use-package-hydra
;;   :ensure t
;;   :after hydra) 


;; (use-package undo-tree
;;   :ensure t
;;   :init (global-undo-tree-mode)
;;   :custom
;;   (undo-tree-auto-save-history nil))

;; (use-package smart-mode-line
;;   :ensure t
;;   :init (sml/setup))

;; (use-package good-scroll
;;   :ensure t
;;   :if window-system          ; 在图形化界面时才使用这个插件
;;   :init (good-scroll-mode))




;; (use-package avy
;;   :ensure t
;;   :config
;;   (defun avy-action-embark (pt)
;; 	(unwind-protect
;; 		(save-excursion
;;           (goto-char pt)
;;           (embark-act))
;;       (select-window
;;        (cdr (ring-ref avy-ring 0))))
;; 	t)
;;   (setf (alist-get ?e avy-dispatch-alist) 'avy-action-embark)
;;   :bind
;;   (("C-j C-j" . avy-goto-char-timer)))






(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


;; (use-package projectile
;;   :ensure t
;;   :bind (("C-c p" . projectile-command-map))
;;   :config
;;   (setq projectile-mode-line "Projectile")
;;   (setq projectile-track-known-projects-automatically nil))



;; ExecPathFromShellPac
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(use-package magit
  :ensure t)








(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(rime quelpa copilot))
 '(package-vc-selected-packages
   '((copilot :vc-backend Git :url "https://github.com/copilot-emacs/copilot.el")
     (find-file-in-project :vc-backend Git :url "https://github.com/redguardtoo/find-file-in-project")
     (color-rg :vc-backend Git :url "https://github.com/manateelazycat/color-rg"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
