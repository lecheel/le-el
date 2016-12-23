; le-loadpackages.el
; loading package
(load "~/.emacs.d/le-packages.el")

;;; evil mode
(require-package 'evil)
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)


(require 'expand-region)
(require 'magit)
(define-key global-map (kbd "C-c g") 'magit-status)
(define-key global-map (kbd "<kp-divide>")   'git-gutter:next-hunk)
(define-key global-map (kbd "<kp-multiply>") 'git-gutter:previous-hunk)


(require 'vdiff)

;;(require 'stock-ticker)
;;(stock-ticker-global-mode +1)
;;(setq stock-ticker-symbols '("3231.TW" "2353.TW"))

;; linum-mode 
(require 'linum-relative)
(global-linum-mode 1)

;; nlinemum mode
;;(require 'nlinum-relative)
;;(nlinum-relative-setup-evil)                    ;; setup for evil
;;(add-hook 'prog-mode-hook 'nlinum-relative-mode)
;;(setq nlinum-relative-redisplay-delay 0)      ;; delay
;;(setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
;;(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...

;;(require 'yasnippet)
;;(yas-global-mode 1)
;;(yas-load-directory "~/.emacs.d/snippets")
;;(add-hook 'term-mode-hook (lambda()
;;    (setq yas-dont-activate t)))

(require 'bracketed-paste)
(bracketed-paste-enable)

(require 'multiple-cursors)
(require 'powerline)
(powerline-default-theme)
(require 'airline-themes)
(load-theme 'airline-papercolor t)

;; evil-leader
(global-evil-leader-mode)
(require 'evil-leader)

;;
;; nerdcommenter
;;

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )

(evil-leader/set-leader ",")
(evil-leader/set-key "SPC" 'ace-jump-mode)
(setq evil-leader/in-all-states 1)
(setq ace-jump-mode-gray-background nil)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-char-mode)
(define-key evil-normal-state-map (kbd "K") 'find-grep-word)
(define-key evil-motion-state-map (kbd "RET") nil)
(evil-leader/set-key "l"  'evil-ace-jump-line-mode)
(evil-leader/set-key "v"  'exchange-point-and-mark)
(evil-leader/set-key "o"  'find-grep-word)
(evil-leader/set-key "gg" 'vc-git-grep)
(evil-leader/set-key "gs" 'magit-status)
(evil-leader/set-key "gd" 'magit-diff)
(evil-leader/set-key "gl" 'magit-log-all)
(evil-leader/set-key "gp" 'magit-log-buffer-file)
(evil-leader/set-key "go" 'magit-log-buffer-file-popup)
(evil-leader/set-key "gb" 'magit-show-refs)
(evil-leader/set-key "k"  'kill-buffer)
(evil-leader/set-key ";"  'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; evil leader
;;(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; iedit for block operation like multiple-cursors
(require 'iedit)
(global-set-key (kbd "C-c =") 'iedit-mode)
(evil-leader/set-key "=" 'iedit-mode)


(global-set-key (kbd "M-p") 'ace-window)

;; the silver searcher ag
(require 'ag)
(setq ag-highlight-search t)

;; cscope
(require 'xcscope)
(evil-leader/set-key "ss" 'cscope-find-this-symbol)
(evil-leader/set-key "se" 'cscope-find-egrep-pattern)
(evil-leader/set-key "sc" 'cscope-find-functions-calling-this-function)
(evil-leader/set-key "sd" 'cscope-find-called-functions)
(evil-leader/set-key "sg" 'cscope-find-global-definition)
(evil-leader/set-key "su" 'cscope-pop-mark)

;; mix rectangle with orginal set-mark stream
(require 'phi-rectangle)
(phi-rectangle-mode 1)

(global-set-key (kbd "C-x <SPC>") 'phi-rectangle-set-mark-command)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)


;; fixed for superwords _ underscore
(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol))

(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

(add-hook 'c-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'rust-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))


