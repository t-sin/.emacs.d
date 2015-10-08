;;;; settings for OS X
;;;; please load this file in init.el


;;; SKK
(auto-install-package 'ddskk)

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
                      (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
                      (and (boundp 'skk-mode-invoked) skk-mode-invoked
                           (skk-set-cursor-properly)))))


(setq mac-pass-control-to-system nil)
