(elpaca dired-open
  (use-package dired-open
    :config
    (setq dired-open-extensions '(("gif" . "sxiv")
                                  ("jpg" . "sxiv")
                                  ("png" . "sxiv")
                                  ("mkv" . "vlc")
                                  ("mp4" . "vlc"))))
  )

(elpaca peep-dired
  (use-package peep-dired
    :after dired
    :hook (evil-normalize-keymaps . peep-dired-hook)
    :config
      (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
      (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
      (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
      (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)
  ))

(elpaca neotree
(use-package neotree
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 55
        neo-window-fixed-size nil
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

;; show hidden files

)
