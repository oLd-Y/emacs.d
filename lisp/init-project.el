;;; Package --- Summary
;;; Commentary:
;;; Code:

(unless (package-installed-p 'find-file-in-project)
  (package-vc-install "https://github.com/redguardtoo/find-file-in-project"))

(use-package find-file-in-project
  :ensure nil
  :config
  :bind
  ("C-c f p" . find-file-in-project-at-point)
  ("C-c f f" . find-file-in-project-by-selected))

(provide 'init-project)
;;; init-project.el ends here
