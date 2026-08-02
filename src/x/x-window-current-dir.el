;;; x-window-current-dir.el --- directory of the frame matching a window title -*- lexical-binding: t; -*-

(require 'seq)

(defun x-window-current-dir (title)
  "Return the directory for the frame whose name or window buffer
matches TITLE (the compositor's window title).  For x-sidebar frames,
return the directory they browse.  Fall back to the selected frame."
  (let* ((frames (frame-list))
         (frame (or (seq-find (lambda (candidate)
                                (or (string-equal (frame-parameter candidate 'name) title)
                                    (string-equal (buffer-name (window-buffer (frame-selected-window candidate)))
                                                  title)))
                              frames)
                    (selected-frame)))
         (sidebar-window (seq-find (lambda (window)
                                     (string-prefix-p "*x-sidebar*" (buffer-name (window-buffer window))))
                                   (window-list frame)))
         (buffer (if sidebar-window
                     (window-buffer sidebar-window)
                   (window-buffer (frame-selected-window frame))))
         (file (buffer-file-name buffer)))
    (if file (file-name-directory file)
      (buffer-local-value 'default-directory buffer))))

(provide 'x-window-current-dir)
;;; x-window-current-dir.el ends here
