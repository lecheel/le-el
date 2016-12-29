; ~/.emacs.d/le-el.el
(load "~/.emacs.d/lestyle.el")
(add-to-list 'auto-mode-alist '("\\TODO\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\emacsrc\\'" . lisp-mode))

;; Remove scrollbars, menu bars, and toolbars
; when is a special form of "if", with no else clause, it reads:
; (when <condition> <code-to-execute-1> <code-to-execute2> ...)
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq make-backup-files nil)

(global-set-key "\C-h" 'delete-backward-char)

;;; super M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;;; custom f10 MENU
(global-set-key [(f10)] 'leMenu)

;;; QuitAll
(global-set-key "\M-q" 'leQuit)

;;; basic brief binding
(global-set-key "\C-k" 'paredit-kill)
(global-set-key "\M--" 'le-previous-buffer) 
(global-set-key "\M-=" 'le-next-buffer)
(global-set-key "\M-b" 'ibuffer)
(global-set-key "\M-c" 'phi-rectangle-set-mark-command)
(global-set-key "\M-d" 'kill-whole-line)
(global-set-key "\M-e" 'find-file)
(global-set-key "\M-t" 'query-replace)
(global-set-key "\M-y" 'er/expand-region)

(global-set-key [(f6)] 'other-window)
(global-set-key [(f8)] 'taglist)
(global-set-key [(f7)] 'evil-jump-item)
(global-set-key [(f9)] 'git-gutter-mode)
(global-set-key [(f3)] 'save-buffer)
(global-set-key [(kp-add)] 'kill-ring-save)




;;; git-gutter
(global-git-gutter-mode t)
(setq git-gutter:separator-sign "|")
(setq git-gutter:modified-sign "#")
(setq git-gutter:added-sign "+")

(evil-leader/set-key "y"  'xah-extend-selection)
(evil-leader/set-key "n"  'git-gutter:next-hunk)
(evil-leader/set-key "p"  'git-gutter:previous-hunk)
(evil-leader/set-key "d"  'git-gutter:popup-hunk)
(evil-leader/set-key "r"  'git-gutter:revert-hunk)


