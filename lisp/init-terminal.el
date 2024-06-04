;;; init-terminal.el --- terminal configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-libvterm/")
(use-package vterm
  :bind
  ("C-c t" . vterm))

(provide 'init-terminal)


;;; init-terminal.el ends here
