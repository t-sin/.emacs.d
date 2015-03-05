;;;; settings for Clojure
;;;; please load this file in init.el


;;;; clojure 設定

;;; packages for package.el
(defvar clojure-packages '(clojure-mode
                           cider))

(auto-install-packages clojure-packages)

;; configure for clojure-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; configure for cider
(add-hook 'cider-repl-mode-hook 'paredit-mode)

