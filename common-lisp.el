;;;; settings for Common Lisp
;;;; please load this file in init.el


;;;; SLIME(Common Lisp)の設定
(add-to-list 'load-path "~/opt/el-systems/slime/")

(setq slime-net-coding-system 'utf-8-unix) ; 文字コード設定

;; Common Lisp 処理系の設定
(setq slime-lisp-implementations
      '((sbcl ("~/.cim/bin/sbcl"))
        (ccl ("~/.cim/bin/ccl"))
        (ecl ("~/.cim/bin/ecl"))
        (clisp ("~/.cim/bin/clisp"))
        (abcl ("~/.cim/bin/abcl"))))


(require 'slime)
(setq slime-contribs '(slime-fancy))
(slime-setup)
(slime-autodoc-mode) ; カーソル位置の関数情報をミニバッファに表示する

