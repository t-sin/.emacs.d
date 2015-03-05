;;;; emacs設定


;;;; 基本設定

;; ロードパスの設定
(add-to-list 'load-path "~/.emacs.d/")

;; 言語を日本語に
;(set-language-environment "Japanese")
(set-language-environment "utf-8")

;; 文字コードはできる限りutf8で
;(prefer-coding-system 'utf-8)

;; 起動時のメッセージ無効
(setq inhibit-startup-message t)

;; オートセーブ
;(auto-save-mode nil)

;; 終了時のオートセーブファイル削除
;(setq delete-auto-save-files t)

;; バックアップファイル
;(setq backup-inhibited nil)

;; Tabの代わりにスペースでインデント
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4 indent-tabs-mode nil)

;; コピペ時、クリップボードにもつっこむ
(cond (window-system
	  (setq x-select-enable-clipboard t)))

;; 選択範囲の挙動を他のエディタ風に
;; （選択して文字列を入力すると、選択範囲が置き換わるとか）
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;;; キーバインドの割り当て
;;;; 基本形: (define-key keymap keys definition)
;;;; keymap: global-map, xxx-mode-map...
;;;; keys: ex; C-x M-x a -> "\C-x\A-xa"
;;;; definition: func

;; C-spaceでmark set
;; AnthyのIM切り替えキーからCtrl-Spaceを消せばおk


;;;; package.el
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; パッケージの自動インストール
(defun auto-install-package (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(defun auto-install-packages (pkgs)
  (dolist (p pkgs)
    (auto-install-package p)))


;;;;外観の設定
(load "appearance")


;;;; メジャーモード

;;; markdown-mode
(auto-install-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;;; プログラミング

;;;; paredit.el
(auto-install-package 'paredit)
(require 'paredit)

;;; 各メジャーモードでparedit
;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; SLIME
(add-hook 'slime-lisp-mode-hook 'enable-paredit-mode)
;; Clojure
(add-hook 'clojure-mode-hook 'enacs-paredit-mode)


;; ファイルの拡張子とメジャーモードの対応付け
;(setq auto-mode-alist
;	  (cons (cons "\\.ext$" 'major-mode) auto-mode-alist))
;; Common Lisp用
;;(setq auto-mode-alist
;;	  (cons (cons "\\.cl$" 'lisp-mode) auto-mode-alist))


;;;; 各言語別設定
;;; Common Lisp
(load "common-lisp")

;;; Clojure
(load "clojure")

;;; Haskell
(load "haskell")

