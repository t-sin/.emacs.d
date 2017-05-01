;;;; config for Common Lisp


(el-get-bundle slime)
(el-get-bundle ac-slime)

;;; slime
; (require 'slime)

;; slime encodings
(setq slime-net-coding-system 'utf-8-unix)

(setq slime-lisp-implementations
      '((ros ("ros" "-Q" "run"))))

(setq slime-contribs '(slime-fancy))
(slime-setup)
(slime-autodoc-mode)


;;; hyperspec
(setq common-lisp-hyperspec-root
      (concat "file://" "/usr/share/doc/hyperspec/"))
(setq common-lisp-hyperspec-symbol-table
      (concat common-lisp-hyperspec-root
              "Data/Map_Sym.txt"))

;;; paredit-mode
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'slime-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)

;;; auto-complete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
