
(use-package eaf
  ;; :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :init
  (setq eaf-proxy-type "http")
  (setq eaf-proxy-host "127.0.0.1")
  (setq eaf-proxy-port "7890")
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (setq eaf-enable-debug t)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki

  :bind
  ("C-c e b" . 'eaf-open-bookmark))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/app/browser")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/app/pdf-viewer")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/app/file-manager")
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/app/pyqterminal")


(use-package eaf-pdf-viewer)

(use-package eaf-browser

  :bind
  ("s-\"" . 'eaf-open-browser-with-history))

(use-package eaf-file-manager
  :hook
  (window-setup . eaf-open-in-file-manager)
  :bind
  ("M-j" . 'eaf-open-in-file-manager))

;; (use-package eaf-pyqterminal)

(provide 'init-eaf)
;;; init-eaf.el ends here
