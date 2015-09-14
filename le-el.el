; ~/.emacs.d/le-el.el

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

;
;(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq make-backup-files nil)

(global-set-key "\C-h" 'delete-backward-char)


;;;
;;;
;;; lesytle LiSP
;;;
;;;


(defun leQuit ()
  (interactive)
  (auto-save-mode nil)
  (save-buffers-kill-terminal)
;;  (save-buffers-kill-emacs)
)

(defun leSave ()
  (interactive)
  (if (and mark-active transient-mark-mode)
      (kill-ring-save (region-beginning) (region-end))
    (save-buffer)
    ))

(defun le-next-buffer()
  (interactive)
  (next-buffer)
  (let ((i 0))
  (while (and 
  		(or (string-match "^*" (buffer-name)) 
                    (string-match "TAGS" (buffer-name)))
        	(< i 50))
  (setq i (1+ i)) (next-buffer) )
  ))

(defun le-prev-buffer()
  (interactive)
    (previous-buffer)
      (let ((i 0))
          (while (and 
  		(or (string-match "^*" (buffer-name)) 
                    (string-match "TAGS" (buffer-name)))          
          	(< i 50))
                (setq i (1+ i)) (previous-buffer) )
  ))
 
(defun leTag ()
  "ctags"
  (interactive nil)
  (setq tags-table-list (list(substring (getenv "TAGFILE") 0 -4)))
  (etags-select-find-tag-at-point)
)

(defun leTagX ()
  "ctags"
  (interactive nil)
  (setq tags-table-list (list(substring (getenv "TAGFILE") 0 -4)))
  (etags-select-find-tag)
)

(defun dupchar ()
  (interactive)
  (let ((char-above (save-excursion
                      (line-move -1)
                      (following-char))))
    (unless (eq char-above ?\n)
      (insert char-above))))

(defun delete-to-word (arg)
  (interactive "p")
  (setq myChar (thing-at-point 'char))
  (if (string-match "[ \t\r\n]" myChar)
	  (progn
		(re-search-forward "[ \t\r\n]+" nil t)
		(replace-match "" nil nil))
	(kill-region (point) (progn (forward-word arg) (point)))
	)
  )

(defun le-save-buffer ()
  "Save-buffer or Kill-ring-save depend on mark-active"
  (interactive)
  (if (and mark-active t)
      (kill-ring-save (point) (mark t))
    (save-buffer))
)

