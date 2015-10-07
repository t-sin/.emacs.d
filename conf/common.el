;;;; common settings


;;;; PATH from shell
(auto-install-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;;; popwin.el
(auto-install-package 'popwin)
(require 'popwin)
(popwin-mode 1)


;;;; major modes

;;; markdown-mode
(auto-install-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; yaml-mode
(auto-install-package 'yaml-mode)
(autoload 'yaml-mode "yaml-mode"
  "Major mode for editing YAML files" t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;; json-mode
(auto-install-package 'json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)

(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
