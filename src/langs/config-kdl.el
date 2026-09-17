;;; -*- lexical-binding: t; -*-
;;;; kdl-mode

(add-to-list 'load-path "~/.emacs.d/deps/emacs-kdl-mode/")

(require 'kdl-mode)
(add-to-list 'auto-mode-alist '("\\.kdl\\'" . kdl-mode))

(advice-add 'kdl-install-tree-sitter-grammar :override #'ignore)

(advice-add 'treesit-ready-p :around
            (lambda (orig language &rest args)
              (unless (eq language 'kdl)
                (apply orig language args))))

(advice-add 'kdl-mode :around
            (lambda (orig &rest args)
              (let ((inhibit-message t))
                (apply orig args))))

(provide 'config-kdl)
