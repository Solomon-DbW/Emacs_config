(elpaca sudo-edit
(use-package sudo-edit
  :config
    (solomon/leader-keys
      "fu" '(sudo-edit-find-file :wk "Sudo find file")
      "fU" '(sudo-edit :wk "Sudo edit file"))))
