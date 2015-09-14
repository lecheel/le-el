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

(provide 'lestyle)
