;;;; config for development


;;; flycheck
(auto-install-packages '(flycheck
                         flycheck-pos-tip))
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; paredit-mode
(auto-install-package 'paredit)
(require 'paredit)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;;; auto-complete
(auto-install-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)


;; files and major modes
; (setq auto-mode-alist
;       (cons (cons "\\.ext$" 'major-mode) auto-mode-alist))


;; yaml-mode
(auto-install-package 'yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; json-mode
(auto-install-package 'json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; js3-mode
(auto-install-package 'js3-mode)


;;; Common Lisp
(load "common-lisp")

;;; Clojure
(load "clojure")

;;; Haskell
(load "haskell")

;;; Python
(load "python")
