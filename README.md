# le-el
le-evil (emacs+vim+....)

# QUiCK key binding
  Fn                    Brief            
-----------------   ---------------------
  F2 DictTrans         Alt-Q Quit All    
  F6 WinSwitch         Alt-B buffers     
  F7 Match Bracket     Alt-E FileFind    
  F8 FunctionList      Alt-D Delete Line 
  F9 gitgutter Mode    Alt-Y Mark Word   
                       Alt-- PrevBuffer  
                       Alt-= NextBuffer  
		      	    					   
  EMaCS                           Leader
----------------------------    -------------------
  C-x C-c   Quit All              ,tl Toggle lineNo
  C-x k     KillBuffer            ,n  gitgutter NextHunk
  C-x 0     KillWindow            ,p  gitgutter PrevHunk
  C-x 1     MaxWindow             ,d  gitgutter Diff
  Alt-x     M-x Command
  C-x C-s   SaveBuffer          == magit ==
  C-x vr    gitgutter Revert      ,gd diff
                                  ,gg grep
                                  ,gl log
                                  ,gs status

 ViM MAGiC
 ================================
 C-v -> I 'typing...' <ESC><ESC> magic #!@$#
 df<SPC>             delete before SPC
 dt<SPC>             delete after SPC
 :%s/<C-V><C-M>//g   remove all ^M
 :%s/$/,/            Add , every end of line
 gq                  reformat paragraph <select first>


# installation
```
$ git clone https://github.com/lecheel/le-el.git ~/.emacs.d
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
* more understand [vim like emacs config](http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html)
