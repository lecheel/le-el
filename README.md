# le-el
le-evil (emacs+vim+....)

# installation
```
$ git clone https://github.com/lecheel/le-el.git
$ ln -s ~/.emacs.d/emacsrc ~/.emacs
```

# tips
* some mode RET not working for <RET>
```
rm .emacs.d/elpa/evil-Nnnnnnnn/evil-maps.elc
evil-maps.el
- (define-key evil-motion-state-map (kbd "RET") 'evil-ret)
+ ;;(define-key evil-motion-state-map (kbd "RET") 'evil-ret)
```
* does evil support <C-R><C-W> [word under cursor](https://github.com/tarao/evil-plugins) in Ex command-mode
* does evil have [set paste](http://stackoverflow.com/questions/18691973/is-there-a-set-paste-option-in-emacs-to-paste-paste-from-external-clipboard) 
* how to set "nowrapscan" ??

