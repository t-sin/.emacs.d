;;;; emacs config

(add-to-list 'load-path "~/.emacs.d/conf")

;;; auto downloading elisp
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defun auto-install-package (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(defun auto-install-packages (pkgs)
  (dolist (p pkgs)
    (auto-install-package p)))

;;; configurations
(load "basic")
(load "appearance")
(load "dev")
