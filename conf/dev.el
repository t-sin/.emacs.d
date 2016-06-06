;;;; config for development


;;; flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)

(add-hook 'after-init-hook 'global-flycheck-mode)
(eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;; paredit-mode
(el-get-bundle paredit)
(require 'paredit)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;;; auto-complete
(el-get-bundle auto-complete)
(require 'auto-complete-config)
(ac-config-default)


;; files and major modes
; (setq auto-mode-alist
;       (cons (cons "\\.ext$" 'major-mode) auto-mode-alist))


;; yaml-mode
(el-get-bundle yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; json-mode
(el-get-bundle json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; js3-mode
(el-get-bundle js3-mode)


;;; Common Lisp
(load "common-lisp")

