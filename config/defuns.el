(defun indent-buffer ()
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    ;;(untabify (point-min) (point-max))
    ))

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun open-config-file ()
  (interactive)
  (find-file "~/.emacs.d/"))

;; From https://www.bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs/
(defun mo-toggle-identifier-naming-style ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun git-grep-prompt ()
  (let* ((default (current-word))
         (prompt (if default (concat "Search for: (default " default ") ") "Search for: "))
         (search (read-from-minibuffer prompt nil nil nil nil default))
         ) (if (> (length search) 0) search (or default ""))))

(defun git-grep (search) "git-grep the entire current repo"
       (interactive (list (git-grep-prompt)))
       (grep-find
        (concat "git --no-pager grep -P -n "
                (shell-quote-argument search))))

(defun win-cmd-escape-argument (arg)
  (replace-regexp-in-string " " "^ " arg))

(defun findstr (search) "git-grep the entire current repo"
       (interactive (list (git-grep-prompt)))
       (grep
        (concat "findstr /n /i /s \""
                (win-cmd-escape-argument search)
                "\" "
               "\"C:\\ssd\\Source\\Projects\\Xledger Development\\Xledger\\X.Web\\Public\\*\"")))
