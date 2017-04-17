;;;; config for web development

;; web-mode
(el-get-bundle web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; json-mode
(el-get-bundle json-mode)
(autoload 'yaml-mode "json-mode"
  "Major mode for editing JSON files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; js3-mode
(el-get-bundle js3-mode)
