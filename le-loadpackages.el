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

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)


;; linum-mode 
(require 'linum-relative)
(global-linum-mode 1)

;;(require 'yasnippet)
;;(yas-global-mode 1)
;;(yas-load-directory "~/.emacs.d/snippets")
;;(add-hook 'term-mode-hook (lambda()
;;    (setq yas-dont-activate t)))

(require 'multiple-cursors)
(require 'powerline)
(powerline-default-theme)
(load-theme 'airline-papercolor t)

;; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)
(setq evil-leader/in-all-states 1)
(setq ace-jump-mode-gray-background nil)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; evil leader
(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

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

;;(define-key global-map (kbd "C-\ s") 'cscope-find-this-symbol)
;;(define-key global-map (kbd "C-\ e") 'cscope-find-egrep-pattern)


