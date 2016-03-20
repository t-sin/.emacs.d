;;;; basic config


;; encodings
(set-language-environment "utf-8")
;(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)

;; indent with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4 indent-tabs-mode nil)

;; killring and clipboard
(cond (window-system
	  (setq x-select-enable-clipboard t)))

;; selection behavior
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; selection area with color
(transient-mark-mode)

;; show correspond paren
(show-paren-mode)

;;; keybinding syntax
;;; sypnosis: (define-key keymap keys definition)
;;; keymap: global-map, xxx-mode-map...
;;; keys: ex; C-x M-x a -> "\C-x\A-xa"
;;; definition: func

(keyboard-translate ?\C-h ?\C-?)


;;; PATH from shell
(auto-install-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;; popwin.el
(auto-install-package 'popwin)
(require 'popwin)
(popwin-mode 1)


;;; major modes

;; markdown-mode
(auto-install-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; yaml-mode
(auto-install-package 'yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; json-mode
(auto-install-package 'json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
