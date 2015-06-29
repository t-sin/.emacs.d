;;;; settings for Common Lisp
;;;; please load this file in init.el


;;;; packages for package.el
(defvar cl-packages '(ac-slime))

(auto-install-packages cl-packages)


;;;; slime
(add-to-list 'load-path "~/opt/el-systems/slime/")
(require 'slime)

;; 文字コード設定
(setq slime-net-coding-system 'utf-8-unix)

;; Common Lisp 処理系の設定
(setq slime-lisp-implementations
      '((sbcl ("~/.cim/bin/sbcl"))
        (ccl ("~/.cim/bin/ccl"))
        (ecl ("~/.cim/bin/ecl"))
        (clisp ("~/.cim/bin/clisp"))
        (abcl ("~/.cim/bin/abcl"))))

(setq slime-contribs '(slime-fancy))
(slime-setup)
(slime-autodoc-mode) ; カーソル位置の関数情報をミニバッファに表示する


;;;; hyperspec
(setq common-lisp-hyperspec-root
      (concat "file://" "/usr/share/doc/hyperspec/"))
(setq common-lisp-hyperspec-symbol-table
      (concat common-lisp-hyperspec-root
              "Data/Map_Sym.txt"))


;;;; auto-complete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
