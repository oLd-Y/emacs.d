;;; init-completion.el --- Completion configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (unless (package-installed-p 'copilot)
;;   (package-vc-install "https://github.com/copilot-emacs/copilot.el"))

(use-package copilot
  :hook
  (prog-mode . copilot-mode)
  (copilot-mode . (lambda ()
                    (setq-local copilot--indent-warning-printed-p t)))
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))





(use-package lsp-bridge
  :load-path "~/lsp-bridge"
  :ensure nil
  :config
  (setq lsp-bridge-enable-log nil)
  (global-lsp-bridge-mode)
  (setq lsp-bridge-enable-org-babel t))

(provide 'init-completion)
;;; init-completion.el ends here
