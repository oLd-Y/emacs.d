;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:




(unless (package-installed-p 'color-rg)
  (package-vc-install "https://github.com/manateelazycat/color-rg"))

(use-package color-rg
  :ensure nil
  ;;:load-path "~/color-rg"
  :config
  (when (eq system-type 'windows-nt)
    (setq color-rg-command-prefix "powershell"))
  :bind
  ("C-c s i" . color-rg-search-input)
  
  )
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

(provide 'init-edit)

;;; init-edit ends here
