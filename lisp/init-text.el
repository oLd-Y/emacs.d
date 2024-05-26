;;; init-text.el --- Text configurations -*- lexical-binding: t -*-

;;; commentary:
;;

;;; Code:

(use-package markdown-mode
  :ensure t
  :demand nil
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-websocket/")
(use-package websocket
  :ensure nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp/websocket-bridge/")
(use-package websocket-bridge
  :ensure nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp/dictionary-overlay/")
(use-package dictionary-overlay
  :ensure nil)




(provide 'init-text)

;;; init-text.el ends here
