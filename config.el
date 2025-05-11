(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install a package via the elpaca macro
;; See the "recipes" section of the manual for more details.

;; (elpaca example-package)

(elpaca elpaca-use-package ;; Install use-package support
     (elpaca-use-package-mode));; Enable use-package :ensure support for Elpaca.

   ;;When installing a package used in the init file itself,
   ;;e.g. a package which adds a use-package key word,
   ;;use the :wait recipe keyword to block until that package is installed/configured.
   ;;For example:
   ;;(use-package general :ensure (:wait t) :demand t)

   ;; Expands to: (elpaca evil (use-package evil :demand t))
(elpaca evil
  (use-package evil
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-mode 1)))

(elpaca evil-collection
  (use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init)))

(elpaca evil-tutor
  (use-package evil-tutor))

   ;;Turns off elpaca-use-package-mode current declaration
   ;;Note this will cause evaluate the declaration immediately. It is not deferred.
   ;;Useful for configuring built-in emacs features.
   (use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))

(elpaca general
  (use-package general
  :config
  (general-evil-setup)

  ;; Set 'SPC' as global leader key
  (general-create-definer solomon/leader-keys
			    :states '(normal insert visual emacs)
		  :keymaps 'override
		  :prefix "SPC" ;; setting leader key
		  :global-prefix "M-SPC") ;; uses Alt-SPC to access leader

  (solomon/leader-keys
   "b" '(:ignore t:wk "buffer")
   "bb" '(switch-to-buffer :wk "Switch buffer")
   "bk" '(kill-this-buffer :wk "Kill this buffer")
   "bn" '(next-buffer :wk "Next buffer")
   "bp" '(previous-buffer :wk "Previous buffer")
   "br" '(revert-buffer :wk "Reload buffer")
 )
  ))

(set-face-attribute 'default nil
		    :font "JetBrains Mono"
		    :height 110
		  :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "JetBrains Mono"
		    :height 120
		  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "JetBrains Mono"
		    :height 110
		  :weight 'medium)

(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
;; ✅ Fix: quote 'italic to prevent void variable error
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)



(add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))

;; Uncomment this line if line spacing needs adjusting
(setq-default line-spacing 0.12)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(set-face-attribute 'default nil
		    :font "JetBrains Mono"
		    :height 110
		  :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "JetBrains Mono"
		    :height 120
		  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "JetBrains Mono"
		    :height 110
		  :weight 'medium)

(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

(add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))

;; Uncommentthis line if line spacing needs adjusting
(setq-default line-spacing 0.12)

(elpaca toc-org
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable)))

(use-package org-bullets
:ensure t
:hook (org-mode . org-bullets-mode))

;;(elpaca which-key
(use-package which-key
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-idle-delay 0.1
	  which-key-side-window-max-height 0.25
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit t
	  which-key-separator " → " ))
;;)
