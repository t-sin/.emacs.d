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
(setq powerline-default-separator 'bar)
(powerline-default-theme)


;;; fonts and frames
(setq frame-size 
      '((width . 100) (height . 45)))
(setq font-en "Ricty")
(setq font-jp "Ricty")
(setq font-size 12.5)

(defun set-fonts (size jp &optional en)
  (when window-system
    (set-face-attribute
     'default nil
     :family en
     :height (truncate (* 10 size)))
    (set-fontset-font
     nil
     'japanese-jisx0208
     (cons jp "unicode-bmp"))
    ;; Display nice Emoji
    (dolist (range '((#x2700 . #x27BF)
                     (#x1F650 . #x1F67F)
                     (#x1F600 . #x1F64F)
                     (#x2600 . #x26FF)
                     (#x1F300 . #x1F5FF)
                     (#x1F900 . #x1F9FF)
                     (#x1F680 . #x1F6FF)))
      (set-fontset-font
        nil range (font-spec :family "Noto Emoji")))
    ;; en-jp font size ratio
    (setq face-font-rescale-alist
          '(((concat ".*" jp ".*" . 1))))))

(set-fonts font-size font-jp font-en)

(setq initial-frame-alist frame-size)


;;; colour scheme
(el-get-bundle sublime-themes)

(when window-system
  (load-theme 'spolsky t))

;; disable shadow on mode line
(dolist (e '(mode-line mode-line-inactive))
  (set-face-attribute e nil
                      :box `(:color ,(face-background 'mode-line))))
