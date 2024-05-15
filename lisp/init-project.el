;;; Package --- Summary
;;; Commentary:
;;; Code:

(unless (package-installed-p 'find-file-in-project)
  (package-vc-install "https://github.com/redguardtoo/find-file-in-project"))

(use-package find-file-in-project
  :ensure nil)

(provide 'init-project)
;;; init-project.el ends here
