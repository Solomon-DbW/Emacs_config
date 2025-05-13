(elpaca general
  (use-package general
    :config
    (general-evil-setup)

    ;; Set 'SPC' as leader key
    (general-create-definer solomon/leader-keys
      :states '(normal insert visual emacs)
      :keymaps 'override
      :prefix "SPC"
      :global-prefix "M-SPC")

  (solomon/leader-keys
            "SPC" '(counsel-M-x :wk "Counsel M-x") ;; Same as Meta-X (Alt-X)

	    "." '(find-file :wk "Find file")
	    "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
	    "g c c" '(comment-line :wk "Comment lines")
	    "f r" '(counsel-recentf :wk "Find recent files")
            "pc" '(clipboard-yank :wk "Paste Clipboard")

	   "a" '(:ignore t :wk "App")
	   "a l a" '(counsel-linux-app :wk "App launcher")

	    "b" '(:ignore t :wk "buffer")
	    "b b" '(switch-to-buffer :wk "Switch buffer")
	    "b i" '(ibuffer :wk "Ibuffer")
	    "b k" '(kill-this-buffer :wk "Kill buffer")
	    "b n" '(next-buffer :wk "Next buffer")
	    "b p" '(previous-buffer :wk "Previous buffer")
	    "b r" '(revert-buffer :wk "Reload buffer")

	    "d" '(:ignore t :wk "Dired")
	    "d d" '(dired :wk "Open dired")
	    "d j" '(dired-jump :wk "Dired jump to current")
	    "d p" '(peep-dired :wk "Peep-dired")

	    "e" '(:ignore t :wk "evaluate/eshell")
	    "e b" '(eval-buffer :wk "Eval buffer")
	    "e d" '(eval-defun :wk "Eval defun")
	    "e e" '(eval-expression :wk "Eval expression")
	    
	    "e l" '(eval-last-sexp :wk "Eval last sexp")
	    "e r" '(eval-region :wk "Eval region")
	   "e s" '(eshell :which-key "Eshell") 


	    "h" '(:ignore t :wk "Help")
	    "h f" '(describe-function :wk "Describe function")
	    "h v" '(describe-variable :wk "Describe variable")
	    ;; "h r r" '((lambda () (interactive) (load-file "~/.config/emacs/init.el")) :wk "Reload emacs config")
	    "h r r" '(reload-init-file :wk "Reload emacs config")
	    
	    "l" '(:ignore t :wk "Load")
	    "l t" '(load-theme :wk "Load theme")

		"m" '(:ignore t :wk "Org")
		"m a" '(org-agenda :wk "Org agenda")
		"m e" '(org-export-dispatch :wk "Org export dispatch")
		"m i" '(org-toggle-item :wk "Org toggle item")
		"m t" '(org-todo :wk "Org todo")
		"m B" '(org-babel-tangle :wk "Org babel tangle")
		"m T" '(org-todo-list :wk "Org todo list")

		    "m b" '(:ignore t :wk "Tables")
		    "m b -" '(org-table-insert-hline :wk "Insert hline in table")

		"m d" '(:ignore t :wk "Date/deadline")
		"m d t" '(org-time-stamp :wk "Org time stamp")

	"n" '(:ignore t :wk "NeoTree")
	    "n t" '(neotree-toggle :wk "NeoTree toggle")

	    "t" '(:ignore t :wk "Toggle")
	    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
	    "t t" '(visual-line-mode :wk "Toggle truncated lines")
	    
	   "t v" '(vterm-toggle :wk "Toggle vterm") 
	    
		"w" '(:ignore t :wk "Windows")
		;; Window splits
		"w c" '(evil-window-delete :wk "Close window")
		"w n" '(evil-window-new :wk "New window")
		"w s" '(evil-window-split :wk "Horizontal split window")
		"w v" '(evil-window-vsplit :wk "Vertical split window")
		;; Window motions
		"w h" '(evil-window-left :wk "Window left")
		"w j" '(evil-window-down :wk "Window down")
		"w k" '(evil-window-up :wk "Window up")
		"w l" '(evil-window-right :wk "Window right")
		"w w" '(evil-window-next :wk "Goto next window")
		;; Move Windows
		"w H" '(buf-move-left :wk "Buffer move left")
		"w J" '(buf-move-down :wk "Buffer move down")
		"w K" '(buf-move-up :wk "Buffer move up")
		"w L" '(buf-move-right :wk "Buffer move right")
	  )))
