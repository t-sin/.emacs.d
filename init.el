;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic config

(setq inhibit-startup-message t)

;; encodings
(set-language-environment "utf-8")
;(prefer-coding-system 'utf-8)

;; indent with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4 indent-tabs-mode nil)

;; selection behavior
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; selection area with color
(transient-mark-mode)

;; killring and clipboard
(if window-system
  (setq x-select-enable-clipboard t))

;; show correspond paren
(show-paren-mode)

;;; keybinding syntax
;;; sypnosis: (define-key keymap keys definition)
;;; keymap: global-map, xxx-mode-map...
;;; keys: ex; C-x M-x a -> "\C-x\A-xa"
;;; definition: func

(define-key key-translation-map [?\C-h] [?\C-?])

;; disable bars
(when window-system
  (tool-bar-mode 0)
  (menu-bar-mode 0))
