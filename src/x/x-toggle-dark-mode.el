;;; -*- lexical-binding: t; -*-
;; frame-background-mode 的作用：
;;
;; - 很多内置 face 的 defface 定义里有针对暗/亮背景的两套配色：
;;
;; 例如：
;;
;; (defface font-lock-comment-face
;;   '((((background light))  :foreground "Firebrick")   ;; 浅色背景用深红
;;     (((background dark))   :foreground "chocolate1"))  ;; 暗色背景用浅红
;;   ...)

(defun x-toggle-dark-mode ()
  (interactive)
  (if (eq frame-background-mode 'dark)
      (progn
        (setq frame-background-mode 'light)
        (set-frame-parameter nil 'background-color "white")
        (set-frame-parameter nil 'foreground-color "black"))
    (progn
      (setq frame-background-mode 'dark)
      (set-frame-parameter nil 'background-color "black")
      (set-frame-parameter nil 'foreground-color "white"))))
