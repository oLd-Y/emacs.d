;;; init.el --- The main entry for emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:



(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path	(expand-file-name "site-lisp" user-emacs-directory))

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








;; (global-set-key (kbd "C-j") nil)
;; ;; 删去光标所在行（在图形界面时可以用 "C-S-<DEL>"，终端常会拦截这个按法)
;; (global-set-key (kbd "C-j C-k") 'kill-whole-line)
;; (setopt use-short-answers t)   ;; Since Emacs 29, `yes-or-no-p' will use `y-or-n-p'



(require 'init-basic)
(require 'init-package)
(require 'init-env)
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





(use-package magit
  :ensure t)








(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(find-file-in-project ace-pinyin avy yasnippet-snippets winum which-key vertico valign shackle rime rainbow-delimiters ox-hugo org-roam org-download org-bullets orderless mwim meow markdown-mode marginalia magit flycheck exec-path-from-shell embark-consult editorconfig doom-themes doom-modeline direnv dashboard copilot color-rg amx all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
