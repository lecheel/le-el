(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)


(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
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
        bind-key
        etags-select
        evil
        evil-leader
        evil-matchit
        evil-paredit
        evil-nerd-commenter
        evil-search-highlight-persist
        evil-visualstar
        evil-org
        expand-region
        git-gutter
        google-translate
        go-mode
        helm
        iedit
        linum-relative
        magit
        markdown-mode
        markdown-mode+
        multiple-cursors
        paredit
        powerline
        powerline-evil
        wgrep
        wgrep-ack
        wgrep-ag
        saveplace
        xcscope
        yasnippet
        phi-rectangle
        bracketed-paste
	rainbow-delimiters
        ))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))
