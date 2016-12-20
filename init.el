(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t)
 '(make-backup-files nil)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(echo-keystrokes 0.01)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(fill-column 78)
 '(frame-title-format (quote ("%f - " user-real-login-name "@" system-name)) t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(history-delete-duplicates t)
 '(linum-format "  %d  ")
 '(puppet-indent-level tab-width)
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(setq inhibit-startup-message t)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(tab-width 4)
 '(transient-mark-mode t))
 
(defalias 'yes-or-no-p 'y-or-n-p)
;;(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(define-key evil-motion-state-map "K" 'find-grep-word)

;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)
