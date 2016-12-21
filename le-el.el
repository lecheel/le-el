; ~/.emacs.d/le-el.el
(load "~/.emacs.d/lestyle.el")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el"))


;; Remove scrollbars, menu bars, and toolbars
; when is a special form of "if", with no else clause, it reads:
; (when <condition> <code-to-execute-1> <code-to-execute2> ...)
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Remember the cursor position of files when reopening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(require 'google-translate)
(require 'google-translate-default-ui)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "zh-TW")
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key (kbd "<f2>")    'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(set-face-attribute 'google-translate-translation-face nil :height 1.4)

(require 'bind-key)
(bind-key* "C-h" 'backward-delete-char)
(require 'helm)
(bind-key "C-h" nil helm-map)


;; Disable prompt asking you if you want to kill a
;; buffer with a live process attached to it.
;; http://stackoverflow.com/questions/268088/how-to-remove-the-prompt-for-killing-emacsclient-buffers
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; paredit
(require 'paredit)

(require 'grep-settings)

;;
;; leStyle key binding
;; 

(global-set-key "\C-k" 'paredit-kill)
(global-set-key "\C-q" 'leQuit)
(global-set-key "\M--" 'le-previous-buffer) 
(global-set-key "\M-=" 'le-next-buffer)
(global-set-key "\M-b" 'ibuffer)
;;(global-set-key "\M-c" 'er/mark-word)
;;(global-set-key "\M-c" 'set-rectangular-region-anchor)
(global-set-key "\M-c" 'phi-rectangle-set-mark-command)
(global-set-key "\M-d" 'kill-whole-line)
(global-set-key "\M-e" 'find-file)
;;(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-q" 'leQuit)
;;(global-set-key "\M-s" 'isearch-forward)
(global-set-key "\M-t" 'query-replace)
(global-set-key "\M-y" 'er/mark-word)
(global-set-key [(f6)] 'other-window)
(global-set-key [(f8)] 'taglist)
(global-set-key [(f7)] 'evil-jump-item)
(global-set-key [(f9)] 'git-gutter-mode)
(global-set-key [(f10)] 'leMenu)
;;(global-set-key (kbd "M-w") 'save-buffer)
(global-set-key [(kp-add)] 'kill-ring-save)

(evil-leader/set-key "y"  'xah-extend-selection)
(evil-leader/set-key "n"  'git-gutter:next-hunk)
(evil-leader/set-key "p"  'git-gutter:previous-hunk)
(evil-leader/set-key "d"  'git-gutter:popup-hunk)

;;; toggle
(evil-leader/set-key "tl"  'linum-mode)

;;; super M-x
(global-set-key (kbd "M-x") 'helm-M-x)

(setq speedbar-tag-hierarchy-method nil)

;;;
;;; wgrep-ack
;;;
(require 'wgrep-ack)
(require 'wgrep-ag)

;;;
;;; vgrep
;;;

(require 'vgrep-mode)
(global-set-key "\M-'" 'vgrep)
(global-set-key [(f11)]'vlist)
(add-hook 'grp-mode-hook '(lambda ()
			    (local-set-key (kbd "RET") 'vEnter)))

;;; taglist
(require 'taglist)

;;
;;; git-gutter
;;

(global-git-gutter-mode t)
(setq git-gutter:separator-sign "|")
(setq git-gutter:modified-sign "#")
(setq git-gutter:added-sign "+")
(set-face-foreground 'git-gutter:separator "yellow")
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)


;;;
;;; for vim-ex <C-R><C-W>
;;;
;;; From https://github.com/tarao/evil-plugins
(require 'evil-ex-registers)
(define-key evil-ex-completion-map (kbd "C-r") #'evil-ex-paste-from-register)


;;;
;;; emacs daemon and emacs client clean up
;;;

(add-hook 'delete-frame-functions
          (lambda (frame)
            (let* ((window (frame-selected-window frame))
                   (buffer (and window (window-buffer window))))
              (when (and buffer (buffer-file-name buffer))
                (kill-buffer buffer)))))

;;;
;;; create tags
;;;

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
    )

;;
;; Vim's "set paste"
;; From  http://stackoverflow.com/questions/18691973/is-there-a-set-paste-option-in-emacs-to-paste-paste-from-external-clipboard
;;
(defvar ttypaste-mode nil)
(add-to-list 'minor-mode-alist '(ttypaste-mode " Paste"))

(defun ttypaste-mode ()
  (interactive)
  (let ((buf (current-buffer))
        (ttypaste-mode t))
    (with-temp-buffer
      (let ((stay t)
            (text (current-buffer)))
        (redisplay)
        (while stay
          (let ((char (let ((inhibit-redisplay t)) (read-event nil t 0.1))))
            (unless char
              (with-current-buffer buf (insert-buffer-substring text))
              (erase-buffer)
              (redisplay)
              (setq char (read-event nil t)))
            (cond
             ((not (characterp char)) (setq stay nil))
             ((eq char ?\r) (insert ?\n))
             ((eq char ?\e)
              (if (sit-for 0.1 'nodisp) (setq stay nil) (insert ?\e)))
             (t (insert char)))))
        (insert-buffer-substring text)))))

(setq linum-relative-current-symbol "")
(setq linum-relative-format "%3s ")
(setq linum-format 'linum-relative)
;;;
;;; more tips from people switch from vim with evil
;;;
;;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/   
;;; http://www.elmindreda.org/emacs.html
;;;
;;;

