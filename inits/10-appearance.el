;;;; appearance


(when window-system
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0))

;; cool splash screen
;; (el-get-bundle dashboard)
;; (setq dashboard-banner-logo-title "May the source be with you!")
;; (setq dashboard-startup-banner 'official)
;; (setq dashboard-items nil)

;; (dashboard-setup-startup-hook)

;; scroll bar
(el-get-bundle yascroll)
(global-yascroll-bar-mode)

;; line and column number in mode line
(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; line number on left of buffer
;(global-linum-mode t)
(setq linum-format "%5d ")

;; powerline
(el-get-bundle powerline)
(when window-system
  (powerline-default-theme))

;;; fonts and frames
(setq frame-size 
      '((width . 100) (height . 45)))
(setq font-en "Ricty")
(setq font-jp "Ricty")
(setq font-size 12.5)

(defun set-fonts (size jp &optional en)
  (when window-system
    ;; English font
    (set-face-attribute
     'default nil
     :family en
     :height (truncate (* 10 size)))
    ;; Japanese font
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     (cons jp "unicode-bmp"))
    ;; en-jp font size ratio
    (setq face-font-rescale-alist
          '(((concat ".*" jp ".*" . 1))))))

(set-fonts font-size font-jp font-en)

(setq initial-frame-alist frame-size)


;;; colour scheme
(el-get-bundle sublime-themes)
(el-get-bundle suscolors-theme)

(when window-system)
  (require 'suscolors-theme)

;; disable shadow on mode line
(dolist (e '(mode-line mode-line-inactive))
  (set-face-attribute e nil
                      :box `(:color ,(face-background 'mode-line))))
