(add-to-list 'load-path "~/.emacs.d/deps/markdown-mode/")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(setq markdown-fontify-code-blocks-natively t)

(add-hook
 'markdown-mode-hook
 (lambda ()
   (local-set-key (kbd "C-s C-s") 'markdown-edit-code-block)
   (local-set-key (kbd "M-p") 'backward-paragraph)
   (local-set-key (kbd "M-n") 'forward-paragraph)
   (local-set-key (kbd "<C-mouse-1>") 'markdown-follow-link-at-point)))

(defun x-markdown--slug (text)
  (let ((slug (downcase (replace-regexp-in-string "<[^>]+>" "" text))))
    (setq slug (replace-regexp-in-string "[^[:nonascii:][:alnum:][:space:]_-]" "" slug))
    (setq slug (replace-regexp-in-string "[[:space:]]+" "-" slug))
    (setq slug (replace-regexp-in-string "-+" "-" slug))
    (replace-regexp-in-string "^-\\|-$" "" slug)))

(defun x-markdown--find-heading (fragment)
  (let ((case-fold-search t)
        (pos nil))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward markdown-regex-header nil t)
        (let* ((text (or (match-string-no-properties 5)
                         (match-string-no-properties 1)))
               (slug (x-markdown--slug (string-trim text))))
          (when (string-equal slug fragment)
            (setq pos (match-beginning 0))
            (goto-char (point-max))))))
    (when pos
      (goto-char pos)
      (ignore-errors (recenter-top-bottom 0))
      t)))

(defun x-markdown--follow-fragment (url)
  (let* ((struct (url-generic-parse-url url))
         (full (url-fullness struct))
         (file (car (url-path-and-query struct)))
         (fragment (url-target struct)))
    (unless (or full (not fragment))
      (when (and (stringp file) (> (length file) 0))
        (find-file file))
      (or (x-markdown--find-heading fragment)
          (message "No heading matched '#%s'" fragment))
      t)))

(add-hook 'markdown-follow-link-functions #'x-markdown--follow-fragment)

;;;; code block

(add-to-list 'load-path "~/.emacs.d/deps/edit-indirect/")
(require 'edit-indirect)
(define-key edit-indirect-mode-map (kbd "C-s C-s") 'edit-indirect-commit)

(add-to-list 'display-buffer-alist
             '("\\*edit-indirect" display-buffer-same-window))
(advice-add 'edit-indirect-commit :around
            (lambda (orig-fun &rest args)
              (let ((parent (overlay-buffer edit-indirect--overlay)))
                (apply orig-fun args)
                (with-current-buffer parent
                  (save-buffer)))))
