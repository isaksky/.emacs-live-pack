;; Place personal bindings here
(require 'paredit)
(define-key global-map (kbd "C-.") 'find-file-in-project)
(define-key global-map (kbd "C-M-.") 'git-find-file)

(define-key global-map (kbd "C-M-s") 'git-grep)

(define-key global-map (kbd "s-}") 'next-buffer)
(define-key global-map (kbd "s-{") 'previous-buffer)

(define-key global-map (kbd "C-w") 'backward-kill-word)
(define-key global-map (kbd "C-x C-k") 'kill-region)
;(define-key global-map (kbd "C-c f") 'indent-buffer)
;(define-key global-map (kbd "C-c C-f") 'indent-buffer)

(define-key global-map (kbd "C-,") 'open-config-file)

(define-key global-map (kbd "C-c C-c") 'comment-or-uncomment-region)

(define-key global-map (kbd "C-M-;") 'ag-project)

;;(global-set-key (kbd "C-.") 'hippie-expand)
;;(global-set-key (kbd "C-:") 'hippie-expand-lines)

(define-key global-map (kbd "s-r") 'replace-string)

(define-key global-map (kbd "C-x b") 'ido-switch-buffer)

(define-key global-map (kbd "s-p") 'other-window)

(define-key key-translation-map [?\C-h] [?\C-?])
;;(global-set-key (kbd "<f1>") 'help-command)

(add-hook 'cider-mode-hook
          (lambda ()
            (define-key nrepl-mode-map (kbd "C-M-e") 'nrepl-eval-region)))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "s-n") 'ace-jump-mode)

(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; Make the scrolling keys give reasonable context
(global-set-key (kbd "C-v")
                (lambda ()
                  (interactive
                   (next-line (/ (window-height (selected-window)) 2))
                   )))

(global-set-key (kbd "M-v")
                (lambda ()
                  (interactive
                   (next-line (- (/ (window-height (selected-window)) 2))))))

;(define-key global-map (kbd "M-C-k") 'backward-kill-sexp)
;; find better key for this one

(global-set-key (kbd "C-M-l") 'mo-toggle-identifier-naming-style)

(global-set-key (kbd "C-c w") 'paredit-splice-sexp-killing-backward)

(global-set-key (kbd "C-c f") 'paredit-splice-sexp-killing-forward)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key global-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

(add-hook 'jsx-mode-hook
          (lambda ()
            (define-key jsx-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)))

(global-set-key (kbd "C-c C-r") 'replace-string)
(define-key paredit-mode-map (kbd "C-c C-r") 'replace-string)

(global-set-key (kbd "C-c `") 'align-regexp)

(global-set-key (kbd "C-c w") 'paredit-splice-sexp-killing-backward)
(global-set-key (kbd "C-c d") 'paredit-splice-sexp-killing-forward)

(global-set-key (kbd "C-c f") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-c b") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)

(global-set-key [mouse-5] 'switch-to-next-buffer)
(global-set-key [mouse-4] 'switch-to-prev-buffer)



