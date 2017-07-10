;;;; confg for Clojure


(el-get-bundle clojure-mode)
(el-get-bundle cider)
(el-get-bundle ac-cider)

;; configure for auto-complete
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

;; parinfer-mode
(add-hook 'clojure-mode-hook #'parinfer-mode)
(add-hook 'cider-repl-mode-hook #'parinfer-mode)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook
          'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook
          'set-auto-complete-as-completion-at-point-function)
