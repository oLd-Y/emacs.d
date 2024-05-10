;;; init-org.el --- Org mode configurations -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(use-package org
  :ensure nil
  :defer t
  :config
  ;; override the default org
  (bind-key* "C-j C-j" 'avy-goto-char-timer)
  (setq org-startup-indented t)
  ;; :hook
  ;; (org-mode . (org-indent-mode))
  )

;; blog backend
(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)


(use-package org-capture
  :ensure nil
  :after org
  :defer t
  :bind
  ("C-c c" . 'org-capture)
  :config
  (setq org-default-notes-file "~/org/all-posts.org")
  ;; (setq org-capture-templates
  ;; 	       '("t" "Task" entry (file+headline "" "Tasks") "* TODO %?\n  %u\n  %a"))
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title))
           (id (org-id-new))) ;Generate a new ID without a prefix
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                   ":EXPORT_FILE_NAME: index"
                   ,(concat ":ID: " id) ;Add the ID property
                   ":END:"
                   "%?\n")                ;Place the cursor here finally
                 "\n")))
  (setq org-capture-templates
	       '(("t" "Task" entry (file+headline "" "Tasks") "* TODO %?\n  %u\n  %a")
		 ("h"                ;`org-capture' binding + h
                 "Hugo post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "~/org/all-posts.org" "Blog Ideas")
                 (function org-hugo-new-subtree-post-capture-template)))))

(use-package org-bullets
  :ensure t
  :config
  (progn
    (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀"))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    ))

(use-package org-roam
  :ensure t)


(use-package org-download
  :ensure t
  :after org
  :custom
  ;; (org-download-image-dir "~/blog/static/")
  ;; (org-download-screenshot-method "scrot -s %s")
  (org-download-method 'attach)
  ;; (org-download-screenshot-file "~/tmp/screenshot.png")
  ;; (org-download-heading-lvl 1)
  )

(provide 'init-org)
;;; init-org.el ends here
