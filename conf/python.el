;;;; Python


(defvar python-packages '(python-mode
                          flycheck-pyflakes))
(auto-install-packages python-packages)

(autoload 'python-mode "python-mode" "python editting mode." t)
(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))
