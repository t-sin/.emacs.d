;;;; settings for appearance
;;;; please load this file in init.el


;;;; 基本設定

;; 行番号表示（下のエリアに"L1"の形で）
(line-number-mode t)

;; 左側に行番号表示
(require 'linum)
;(global-linum-mode t)
(setq linum-format "%5d ")

;; 選択範囲に色を付ける
(setq transient-mark-mode t)

;; 対応する括弧を光らせる
(show-paren-mode)

;; メニューバー（アイコンのほう）をかくす
(tool-bar-mode 0)



;;;; minimap
;;;; to enable minimap: M-x siblimity-map
(auto-install-package 'sublimity)
(require 'sublimity)
(require 'sublimity-map)
(sublimity-map-set-delay 0)



;;;; フォントとウィンドウ

;; フレームサイズ(文字数)
(setq frame-size 
      '((width . 100) (height . 45)))

;; フォントサイズ
(setq font-size 12.5)
0
;; 欧文フォント
;(setq font-en "Ubuntu Mono")
(setq font-en "Ricty")

;; 和文フォント
(setq font-jp "Ricty")
;(setq font-jp "Ume Mincho")


(defun set-fonts (size jp &optional en)
  (when window-system
    ;; 欧文フォント設定
    (set-face-attribute
     'default nil
     :family en
     :height (truncate (* 10 size)))
    ;; 和文フォント設定
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     (cons jp "unicode-bmp"))
    ;; 全角半角比
    (setq face-font-rescale-alist
          '(((concat ".*" jp ".*" . 1.2))))))

(set-fonts font-size font-jp font-en)

;; 起動時のウィンドウサイズ（文字数）
(setq initial-frame-alist
      frame-size)



;;;; colour scheme
;; sublime themes
(auto-install-package 'sublime-themes)

(when window-system
  (load-theme 'spolsky t))

;; モードラインの影消し
(dolist (e '(mode-line mode-line-inactive))
  (set-face-attribute e nil
                      :box `(:color ,(face-background 'mode-line))))
