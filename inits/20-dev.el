;;;; config for development


(el-get-bundle magit)

;;; flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)

(add-hook 'after-init-hook 'global-flycheck-mode)
(eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;; paredit-mode
(el-get-bundle paredit)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;;; auto-complete
(el-get-bundle auto-complete)
(ac-config-default)


;; files and major modes
; (setq auto-mode-alist
;       (cons (cons "\\.ext$" 'major-mode) auto-mode-alist))


;; yaml-mode
(el-get-bundle yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
