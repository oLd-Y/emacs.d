;;; init-yas.el --- Org moe configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'init-yas)

;;; init-yas.el ends here
