;;; python


(el-get-bundle python-mode)
(el-get-bundle flycheck-pyflakes)

(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))
