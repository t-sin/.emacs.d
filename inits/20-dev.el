;;;; config for development


(el-get-bundle magit)

;;; flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-pos-tip)

(add-hook 'after-init-hook 'global-flycheck-mode)
(eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;; paredit and parinfer
(el-get-bundle paredit)
(el-get-bundle parinfer)
(add-hook 'parinfer-mode-enable-hook
          (lambda () (define-key parinfer-mode-map
                       (kbd "C-,") #'parinfer-toggle-mode)))
(setq parinfer-extensions
      '(defaults       ; should be included.
        pretty-parens  ; different paren styles for different modes.
        ; evil           ; If you use Evil.
        ; lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
        ; paredit        ; Introduce some paredit commands.
        smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
        smart-yank))   ; Yank behavior depend on mode.
(add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
(add-hook 'scheme-mode-hook #'parinfer-mode)
(add-hook 'lisp-mode-hook #'parinfer-mode)

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

;; nim-mode
(el-get-bundle nim-mode)
(autoload 'nim-mode ”nim-mode"
  "Major mode for editing Nim sources" t)
(add-to-list 'auto-mode-alist '("\\.nim\\'" . nim-mode))
