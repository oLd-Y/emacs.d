;;; init-env.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

;; ExecPathFromShellPac
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(provide 'init-env)
;;; init-env.el ends here
