;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; utility

(defun depends-on (path)
  (concat user-emacs-directory "dependency" path))

;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; packages

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (add-to-list 'load-path (depends-on "/use-package"))
  (require 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; appearance

;; spolsky theme
(when window-system
  (add-to-list 'custom-theme-load-path
               (depends-on "/emacs-color-themes/themes"))
  (load-theme 'spolsky t))

;; line/column numbers in the mode line
(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; frame size
(when window-system
  (set-frame-size nil 120 60))

;; set font to Ricty 13pt
;; code generated by
;;   1. "Options"->"Set default font"
;;   2. Select favorite font
;;   3. "Options"->"Save options"
(custom-set-faces
 '(default ((t (:family "Ricty" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))

;; elscreen
(use-package elscreen
  :ensure t
  :init (elscreen-start))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; software development

;; markdown mode
(add-to-list 'load-path (depends-on "/markdown-mode"))
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; magit

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; common lisp

(add-to-list 'load-path (depends-on "/paredit"))
(require 'paredit)

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-lisp-implementations
      '((ros ("ros" "-Q" "run"))))

(setq slime-c3ontribs '(slime-fancy))
(add-to-list 'load-path (depends-on "/slime"))
(require 'slime-autoloads)
;;(slime-autodoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; rust

(add-to-list 'load-path (depends-on "/rust-mode"))
(require 'rust-mode)
(add-to-list 'load-path (depends-on "/cargo.el"))
(require 'cargo)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook #'lsp)

(defun cargo-project-p (_)
  (let (dir)
    (ignore-errors
      (let* ((output (shell-command-to-string "cargo metadata --no-deps --format-version 1"))
	     (js (json-read-from-string output)))
	(setq dir (cdr (assq 'workspace_root js)))))
    (and dir (cons 'transient  dir))))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company

(use-package company :ensure t)
(add-hook 'after-init-hook '(lambda ()
                              ;;(global-company-mode)
                              (delete 'company-preview-if-just-one-frontend company-frontends)
                              (define-key company-active-map (kbd "C-h") 'backward-delete-char)))

(use-package company-quickhelp
  :ensure t
  :config (company-quickhelp-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; lsp

(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((rust-mode . (lambda () (if (cargo-project-p ()) (lsp))))
         (lsp-mode . lsp-enable-which-key-integration))
  :bind ("C-c h" . lsp-describe-thing-at-point))
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
