;;; init-completion.el --- Completion configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t
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
  (global-lsp-bridge-mode))

(provide 'init-completion)
;;; init-completion.el ends here
