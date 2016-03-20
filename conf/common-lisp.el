;;;; config for Common Lisp

(defvar cl-packages '(slime
                      ac-slime))
(auto-install-packages cl-packages)

;;; slime
(require 'slime)

;; slime encodings
(setq slime-net-coding-system 'utf-8-unix)

(setq slime-lisp-implementations
      '((sbcl ("ros" "-L" "sbcl-bin" "-Q" "run"))
        (ccl ("ros" "-L" "ccl-bin" "-Q" "run"))
        (ecl ("~/.cim/bin/ecl"))
        (clisp ("~/.cim/bin/clisp"))
        (abcl ("~/.cim/bin/abcl"))))

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
(add-hook 'lisp-mode 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'slime-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)

;;; auto-complete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
