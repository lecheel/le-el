;;;
;;;
;;; lesytle LiSP
;;;
;;;

(add-hook
 'pre-command-hook
 (lambda ()
   (when (eq menu-bar-mode 42)
     (menu-bar-mode -1))))

(defun leMenu ()
  (interactive)
  (unless menu-bar-mode
  (menu-bar-mode 1))
  (menu-bar-open)
  (setq menu-bar-mode 42)
  )

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

(defun le-previous-buffer()
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

;;
;; From https://github.com/xahlee/xah-fly-keys
;;
(defun xah-extend-selection (arg &optional incremental)
    "Select the current word.
Subsequent calls expands the selection to larger semantic unit.
This command works mostly in lisp syntax.
Written by Nikolaj Schumacher, 2008-10-20. Released under GPL 2"
    (interactive
     (list (prefix-numeric-value current-prefix-arg)
	   (or (use-region-p)
	       (eq last-command this-command))))
    (if incremental
	(progn
	  (xah-semnav-up (- arg))
	  (forward-sexp)
	  (mark-sexp -1))
      (if (> arg 1)
	  (xah-extend-selection (1- arg) t)
	(if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
	    (goto-char (match-end 0))
	  (unless (memq (char-before) '(?\) ?\"))
	    (forward-sexp)))
	(mark-sexp -1))))

(defun xah-select-text-in-quote ()
    "Select text between the nearest left and right delimiters.
Delimiters here includes the following chars: \"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
This command does not properly deal with nested brackets.
URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2015-05-16"
    (interactive)
    (let (
	  (ξskipChars
	   (if (boundp 'xah-brackets)
	       (concat "^\"" xah-brackets)
	     "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
	  ξp1
	  ξp2
	  )
      (skip-chars-backward ξskipChars)
      (setq ξp1 (point))
      (skip-chars-forward ξskipChars)
      (setq ξp2 (point))
      (set-mark ξp1)))


(defun le-select-word ()
  "Select a word under cursor."
  (interactive)
  (grep-find 
  (save-excursion
    (let (b1 b2)
      (skip-chars-backward "-_A-Za-z0-9")
      (setq b1 (point))
      (skip-chars-forward "-_A-Za-z0-9")
      (setq b2 (point))
      (set-mark b1)
      (kill-ring-save b1 b2)
      )))
  )


(defun my-copy-rectangle (start end)
   "Copy the region-rectangle instead of `kill-rectangle'."
   (interactive "r")
   (setq killed-rectangle (extract-rectangle start end))
   (kill-ring-save start end))
 
(global-set-key (kbd "C-x r c") 'my-copy-rectangle)

(provide 'lestyle)
