;;;; appearance


(when window-system
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0))

;; scroll bar
(el-get-bundle yascroll)
(global-yascroll-bar-mode)

;; line and column number in mode line
(line-number-mode t)
(column-number-mode t)

;; line number on left of buffer
(require 'linum)
;(global-linum-mode t)
(setq linum-format "%5d ")

