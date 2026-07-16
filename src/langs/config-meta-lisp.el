(add-to-list 'load-path "~/.emacs.d/deps/meta-lisp-mode")
(require 'meta-lisp-mode)

(setq meta-lisp-highlight-function-calls t)

(setq auto-mode-alist (cons `("\\.basic$" . meta-lisp-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.basic2$" . meta-lisp-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.x86.asm$" . meta-lisp-mode) auto-mode-alist))
