;;;; settings for Clojure
;;;; please load this file in init.el


;;;; clojure 設定

;;; packages for package.el
(defvar clojure-packages '(clojure-mode
                           cider
                           ac-cider))

(auto-install-packages clojure-packages)

;; configure clojure-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; configure cider
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; configure for auto-complete
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

