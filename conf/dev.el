;;;; configurations for development


;;;; flycheck
(auto-install-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;; paredit.el
(auto-install-package 'paredit)
(require 'paredit)

;;;; auto-complete.el
(auto-install-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)


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

;;; Python
(load "python")
