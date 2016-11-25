;;;; config for OS X


;;; SKK
(el-get-bundle ddskk)


;;; font and theme settings. see 10-appearance.el
(set-fonts 17 font-jp font-en)

(el-get-bundle color-theme-solarized)
(el-get-bundle suscolors-theme)

(require 'suscolors-theme)


;;skk-server AquaSKK
(setq skk-server-portnum 1178)
(setq skk-server-host "localhost")

(global-set-key "\C-x\C-j" 'skk-mode)

(add-hook 'isearch-mode-hook
          (function (lambda ()
                      (and (boundp 'skk-mode) skk-mode
                           (skk-isearch-mode-setup)))))
(add-hook 'isearch-mode-end-hook
          (function (lambda ()
                      (and (boundp 'skk-mode)
                           skk-mode
                           (skk-isearch-mode-cleanup))
                      (and (boundp 'skk-mode-invoked)
                           skk-mode-invoked
                           (skk-set-cursor-properly)))))

(setq mac-pass-control-to-system nil)


;;; haskell stack hack
(setq haskell-program-name "/usr/local/bin/stack repl")
