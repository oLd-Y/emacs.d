;;; init-auto-save.el --- auto-save configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package auto-save
  :config
  (auto-save-enable)

  :custom
  (auto-save-silent 1))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/ws-butler")
(use-package ws-butler
  :config
  (ws-butler-global-mode 1))


(provide 'init-auto-save)


;;; init-auto-save.el ends here
