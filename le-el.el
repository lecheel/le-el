; ~/.emacs.d/le-el.el
(load "~/.emacs.d/lestyle.el")

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


;;
;; leStyle key binding
;; 
(global-set-key "\M-=" 'le-next-buffer)
(global-set-key "\M--" 'le-previous-buffer) 
(global-set-key "\M-q" 'leQuit)
(global-set-key "\C-q" 'leQuit)
(global-set-key "\M-d" 'kill-whole-line)
;;(global-set-key "\M-y" 'le-markword)
(global-set-key "\M-c" 'er/mark-word)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-b" 'ibuffer)
(global-set-key "\M-d" 'kill-whole-line)
(global-set-key "\M-e" 'find-file)
(global-set-key "\M-s" 'isearch-forward)
(global-set-key "\M-t" 'query-replace)

(global-set-key [(f9)] 'git-gutter-mode)
(global-set-key [(f6)] 'other-window)
;
;(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq make-backup-files nil)

(global-set-key "\C-h" 'delete-backward-char)


;;
;;; git-gutter
;;

(global-git-gutter-mode t)
(setq git-gutter:separator-sign "|")
(set-face-foreground 'git-gutter:separator "yellow")

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


