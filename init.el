;;;; emacs設定


;; ロードパスの設定
(add-to-list 'load-path "~/.emacs.d/conf")

;;;; package.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;; パッケージの自動インストール
(defun auto-install-package (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(defun auto-install-packages (pkgs)
  (dolist (p pkgs)
    (auto-install-package p)))


;;;; basic config
(load "basic")

;;;; 外観の設定
(load "appearance")

;;;; プログラミング
(load "dev")
