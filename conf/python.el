;;;; Python


(defvar python-packages '(python-mode
                          jedi))
(auto-install-packages python-packages)

(add-hook 'python-mode-hook
          '(lambda ()
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)
