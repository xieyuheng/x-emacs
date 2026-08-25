;;; -*- lexical-binding: t; -*-
(defun x-wayland-p ()
  (or (getenv "WAYLAND_DISPLAY")
      (equal (getenv "XDG_SESSION_TYPE") "wayland")))

(defun x-x11-p ()
  (and (not (x-wayland-p))
       (or (getenv "DISPLAY")
           (equal (getenv "XDG_SESSION_TYPE") "x11"))))

(provide 'x-session)
