;;; -*- lexical-binding: t; -*-
(defun x-paste-from-clipboard ()
  (interactive)
  (cond
   ((eq system-type 'windows-nt)
    (let ((sel (or (ignore-errors (gui-get-selection 'CLIPBOARD))
                   (ignore-errors (w32-get-clipboard-data)))))
      (if (and (stringp sel) (not (string-empty-p sel)))
          (insert sel)
        (message "剪贴板为空"))))
   ((x-wayland-p) (x-paste-from-clipboard--run "wl-paste" "--primary --no-newline"))
   ((x-x11-p)     (x-paste-from-clipboard--run "xclip" "-o"))
   (t             (message "既非 Wayland 也非 X11 会话"))))

(defun x-paste-from-clipboard--run (tool args)
  (if (executable-find tool)
      (let ((sel (eshell-command-result (format "%s %s 2>/dev/null" tool args))))
        (if (and sel (not (string-empty-p sel)))
            (insert sel)
          (message "primary selection 为空")))
    (message "未找到工具 %s" tool)))

(provide 'x-paste-from-clipboard)