; "I don't know which is right, I am just superstitious."
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; (setenv "PATH" (concat ";C:\\Users\\isak.sky\\AppData\\Local\\Programs\\Git\\usr\\bin" (getenv "PATH")))
;; (add-to-list 'exec-path ";C:\\Users\\isak.sky\\AppData\\Local\\Programs\\Git\\usr\\bin;")



(add-to-list 'load-path "~/.emacs.d/start")
(add-to-list 'load-path "~/.emacs.d/lib")
(add-to-list 'load-path "~/.emacs.d/lib/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/lib/theme")


(load "~/.emacs.d/lib/editor-config.el")

(load "~/.emacs.d/lib/rainbow-delimiters.el")
(load "~/.emacs.d/lib/git-find-file.el")
(require 'rainbow-delimiters)

(require 'tomorrow-night-theme)
(require 'emacs-modular-configuration)
(require 'mic-paren)

(scroll-bar-mode -1)
(require 'clojure-mode)



(require 'package)


;; (add-to-list 'package-archives
             ;; '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.milkbox.net/packages/") t)

;; (add-to-list 'package-archives 
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'exec-path-from-shell)

(unless (package-installed-p 'cider)
  (package-install 'cider))

(color-theme-tomorrow-night-blue)

(load "~/.emacs.d/config" t)

(delete-selection-mode 1)

(setq-default indent-tabs-mode nil)

(add-hook 'emacs-list-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)

(require 'flycheck)

(defalias 'yes-or-no-p 'y-or-n-p)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers '(javascript-jshint)))

(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook #'rainbow-delimiters-mode-enable)


;(require 'js2-mode)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;;(require 'emacs-modular-configuration)
;; (add-to-list 'load-path "./config")
;; ;;(load (concat (live-pack-lib-dir) "tomorrow-night-theme.el"))
;; (live-load-config-file "ruby-mode.el")
;; (live-load-config-file "stripped-starter-kit-bindings.el")
;; (live-load-config-file "setup-hippie.el")
;; (live-load-config-file "ruby-mode.el")
;; (live-load-config-file "setup-paredit.el")
;; ;(load-file (concat (live-pack-lib-dir) "tomorrow-night-theme.el"))
;; ;;(live-load-config-file "setup-ido.el")

;; (live-load-config-file "stripped-starter-kit-bindings.el")
;; (live-load-config-file "defuns.el")
;; (live-load-config-file "bindings.el")

;; (load (concat (live-pack-lib-dir) "unbound.el"))

;; ;; fix the modes you know
;; (add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))
;; (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.json_builder$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq make-backup-files nil)
(setq auto-save-default nil)

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; (setq make-backup-files nil)

;; (global-auto-revert-mode 1)

;; ;; Stop backup and auto saving!
;; (setq make-backup-files nil)
;; (setq auto-save-default nil)

;; ;; This stops the retarded thing where, when creating a new file, you
;; ;; have to type it really quickly otherwise ido will look in other
;; ;; places and change directories on you.
;; (setq ido-auto-merge-work-directories-length -1)

;; ;; Tell emacs to STFU about modified and active things and active processes when quitting:
;; ;; Doesn't work :(

;; (defun coffee-custom ()
;;   "coffee-mode-hook"
;;   ;; CoffeeScript uses two spaces.
;;   (make-local-variable 'tab-width)
;;   (set 'tab-width 2))

;; (add-hook 'coffee-mode-hook 'coffee-custom)

;; ;(setq require-final-newline 't)

;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; ;; Enable eldoc in clojure buffers:
;; ;; (add-hook 'nrepl-interaction-mode-hook
;; ;;           'nrepl-turn-on-eldoc-mode)

;; ;; Stop the error buffer from popping up while working in the REPL buffer:
;; ;; (setq nrepl-popup-stacktraces nil)

;; ;;(add-to-list 'same-window-buffer-names "*nrepl*")
;; ;; (add-hook 'cider-mode-hook 'paredit-mode)
;; ;; (add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (define-key ruby-mode-map "{" nil)
;;             (define-key ruby-mode-map "}" nil)))

;; (defun electric-pair ()
;;   "If at end of line, insert character pair without surrounding spaces.
;;     Otherwise, just insert the typed character."
;;   (interactive)
;;   (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

;; (add-hook 'coffee-mode-hook
;;           (lambda ()
;;             ;(modify-syntax-entry ?_ "_")
;;             (define-key coffee-mode-map "(" 'electric-pair)
;;             (define-key coffee-mode-map "[" 'electric-pair)
;;             (define-key coffee-mode-map "{" 'electric-pair)))

;; (add-hook 'clojure-mode-hook
;;           (lambda ()
;;             (define-key clojure-mode-map "[" 'electric-pair)
;;             (define-key clojure-mode-map "{" 'electric-pair)))

;; (add-hook 'html-mode-hook
;;           (lambda ()
;;             (define-key html-mode-map (kbd "C-c C-j") 'zencoding-expand-line)
;;             (define-key html-mode-map (kbd "C-M-k") 'sgml-delete-tag)
;;             (define-key html-mode-map (kbd "C-c C-e") 'sgml-close-tag)))

;; ;; make underscores count as word boundaries
;; ;(modify-syntax-entry ?_ "_")
;; ;; (defun change-major-mode-hook ()
;; ;;   (modify-syntax-entry ?_ "_"))

;; (setq scss-compile-at-save nil)

;; (setq ffip-find-options "-not -regex \".*build.*\" -o -regex \".*vendor.\"")

;; (defadvice sgml-delete-tag (after reindent-buffer activate)
;;   (indent-buffer))

(defun git-grep-prompt ()
  (let* ((default (current-word))
         (prompt (if default (concat "Search for: (default " default ") ") "Search for: "))
         (search (read-from-minibuffer prompt nil nil nil nil default))
         ) (if (> (length search) 0) search (or default ""))))

(defun git-grep (search) "git-grep the entire current repo"
       (interactive (list (git-grep-prompt)))
       (grep-find
        (concat "git --no-pager grep -P -n "
                (shell-quote-argument search)
               ; (shell-quote-argument (shell-command "git rev-parse --show-toplevel"))
                ;" `git rev-parse --show-toplevel`"
                )))

;(shell-quote-argument (shell-command "git rev-parse --show-toplevel"))

;; (setq live-disable-zone t) ;; frothing at the mouth about this

(setq js2-indent-switch-body 2)

(defun vc-git-grep2 (search)
  (interactive
   (progn
     (vc-git-grep search "*" "."))))

(defun vc-git-grep2 (regexp)
  (interactive
   (progn
     (grep-compute-defaults)
     (cond
      ((equal current-prefix-arg '(16))
       (list (read-from-minibuffer "Run: " "git grep" nil nil 'grep-history)
    nil))
      (t (let* ((regexp (grep-read-regexp))
                (dir (read-directory-name "In directory: " nil default-directory t)))
           (list regexp dir))))))
  (require 'grep)
  (when (and (stringp regexp) (> (length regexp) 0))
    (let ((command regexp))
      (if (> 4 5)
    (if (string= command "git grep")
     (setq command nil))
  (setq dir (file-name-as-directory (expand-file-name dir)))
  (setq command
     (grep-expand-template "git grep -n -i -e <R>" regexp))
  (when command
    (if (equal current-prefix-arg '(4))
     (setq command
     (read-from-minibuffer "Confirm: " command nil nil 'grep-history))
   (add-to-history 'grep-history command))))
      (when command
  (let ((default-directory dir)
     (compilation-environment '("PAGER=")))
    ;; Setting process-setup-function makes exit-message-function work
    ;; even when async processes aren't supported.
    (compilation-start command 'grep-mode))
  (if (eq next-error-last-buffer (current-buffer))
   (setq default-directory dir))))))

;(require 'paredit) ;if you didn't install via package.el
;(defun turn-on-paredit () (paredit-mode 1))
;(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook #'paredit-mode)

(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'utf-8)
  (set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (unless (eq system-type 'windows-nt)
   (set-selection-coding-system 'utf-8))
  (prefer-coding-system 'utf-8)

;; ;; fsharp
;; (add-to-list 'load-path "~/.emacs.d/fsharp-mode/")
;; (autoload 'fsharp-mode "fsharp-mode"     "Major mode for editing F# code." t)
;; (add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
 '(inhibit-startup-screen t)
 '(js2-basic-offset 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(highlight ((t (:background "#0c314a")))))

