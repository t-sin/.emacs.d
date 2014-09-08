;;;; settings for Haskell
;;;; please load this file in init.el


;;;; haskell-mode
(auto-install-packages '(haskell-mode))

;; 拡張子とメジャーモード
;; lhs: Haskellで文芸的プログラミング
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; Haskell コマンドと haskell-mode
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用

;; ドキュメンテーション
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; replの設定
(setq haskell-program-name "/usr/bin/ghci")


