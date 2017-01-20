(require 'package)
(setq package-archives '(
			("melpa" . "http://melpa.org/packages/")
			))

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
	ack-menu
	airline-themes
	ag
	pt
	etags-select
	evil
	evil-leader
	evil-matchit
	evil-paredit
	evil-nerd-commenter
	evil-org
	expand-region
	git-gutter
	google-translate
	helm
	iedit
	imenu-list
	linum-relative
	magit
	markdown-mode+
	powerline
	powerline-evil
	wgrep
	wgrep-ack
	wgrep-ag
	which-key
	rainbow-delimiters
	saveplace
	xcscope
	phi-rectangle
	bracketed-paste
	elpy
	auto-complete
	))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))
