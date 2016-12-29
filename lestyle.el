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
  (setq tags-table-list (list(concat (substring (getenv "TAGFILE") 0 -4) "TAGS")))
  (evil-jump-to-tag)
;;  (etags-select-find-tag-at-point)
)

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

(defun my-copy-rectangle (start end)
   "Copy the region-rectangle instead of `kill-rectangle'."
   (interactive "r")
   (setq killed-rectangle (extract-rectangle start end))
   (kill-ring-save start end))
 
(global-set-key (kbd "C-x r c") 'my-copy-rectangle)

(provide 'lestyle)
