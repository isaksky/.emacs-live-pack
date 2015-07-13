;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config

(add-to-list 'load-path "~/.emacs.d/start")
(add-to-list 'load-path "~/.emacs.d/lib")
(add-to-list 'load-path "~/.emacs.d/lib/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/lib/theme")

(require 'tomorrow-night-theme)
(require 'emacs-modular-configuration)
(require 'mic-paren)

(scroll-bar-mode -1)
(require 'clojure-mode)

(require 'package)

;; (add-to-list 'package-archives
             ;; '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

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

;; (setq live-disable-zone t) ;; frothing at the mouth about this

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
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(highlight ((t (:background "#0c314a")))))

