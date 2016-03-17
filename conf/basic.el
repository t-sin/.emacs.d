;;;; common settings


;;;; 基本設定

;; 言語を日本語に
;(set-language-environment "Japanese")
(set-language-environment "utf-8")

;; 文字コードはできる限りutf8で
;(prefer-coding-system 'utf-8)

;; 起動時のメッセージ無効
(setq inhibit-startup-message t)

;; オートセーブ
(auto-save-mode t)

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

;; C-hでbackspace
(keyboard-translate ?\C-h ?\C-?)

;; C-spaceでmark set
;; AnthyのIM切り替えキーからCtrl-Spaceを消せばおk


;;;; PATH from shell
(auto-install-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;;; popwin.el
(auto-install-package 'popwin)
(require 'popwin)
(popwin-mode 1)


;;;; major modes

;;; markdown-mode
(auto-install-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; yaml-mode
(auto-install-package 'yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;; json-mode
(auto-install-package 'json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
