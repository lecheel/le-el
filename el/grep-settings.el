(autoload 'grep-apply-setting "grep"
  "Set SYMBOL to VALUE, and update `grep-host-defaults-alist'.
SYMBOL should be one of `grep-command', `grep-template',
`grep-use-null-device', `grep-find-command',
`grep-find-template', `grep-find-use-xargs', or
`grep-highlight-matches'.")

(defun find-grep-word (dir)
  "Run `grep' to find current word in directory DIR."
  (interactive "P")
  (grep-compute-defaults)
  (set-grep-command (concat "find . ! -name \"*.o\" ! -name \"*.pyc\" ! -name \"*.elc\" ! -name \"*~\" ! -name \".git\" -type f -exec grep -nH -e "))
  (let* ((word (current-word)) command-args)
    (if (not word)
        (message "No word under cursor.")
      (setq command-args
            (if grep-find-command
                (concat grep-find-command word " {} +")
              (concat grep-command word " . /*")))
        (grep command-args))))

(defun set-grep-command (command)
  "Set `grep-command'."
    (grep-apply-setting 'grep-find-command command )
    (setq grep-find-command command))

(provide 'grep-settings)
