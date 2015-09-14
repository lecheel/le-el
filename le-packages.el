(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives
;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)


(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION."
    (if (package-installed-p package min-version)
	t
      (if (or (assoc package package-archive-contents) no-refresh)
	  (package-install package)
	(progn
	  (package-refresh-contents)
	  (require-package package min-version t)))))

(package-initialize)

(setq package-list
      '(
	ace-jump-mode
	ace-jump-buffer
	ace-window
	ace-popup-menu
	ack
	ack-menu
	airline-themes
	ag
	etags-select
	evil
	evil-leader
	evil-visualstar
	git-gutter
	helm
	linum-relative
	magit
	multiple-cursors
	powerline
	powerline-evil
	wgrep
	wgrep-ack
	saveplace
	xcscope
	yasnippet
	))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))
