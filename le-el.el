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


