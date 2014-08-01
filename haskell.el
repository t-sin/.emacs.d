;;;; settings for Haskell
;;;; please load this file in init.el


;;;; haskell-mode
(add-to-list 'load-path "~/opt/el-systems/haskell-mode/")

(require 'haskell-mode)
(require 'haskell-cabal)

;; 拡張子とメジャーモード
;; lhs: Haskellで文芸的プログラミング
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; Haskell コマンドと haskell-mode
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用

;; replの設定
(setq haskell-program-name "/usr/bin/ghci")

;; ghc-mod
;; 
;;  * 事前にcabal (Common Lispでいうquicklisp) でインストールしておく
;;  * $ cabal update; cabal install cabal-install; cabal install ghc-mod
;;
;; cabal でインストールしたライブラリのコマンドが格納されている
;; bin ディレクトリへのパスを exec-path に追加する
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
;; ghc-flymake.el などがあるディレクトリ ghc-mod を ~/.emacs.d 以下で管理することにした
(add-to-list 'load-path "~/.cabal/share/ghc-mod-3.1.7") 

(autoload 'ghc-init "ghc" nil t)

(add-hook 'haskell-mode-hook
  (lambda () (ghc-init)))


