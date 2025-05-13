(elpaca haskell-mode
  (use-package haskell-mode))

(elpaca python-mode
(use-package python-mode))  

  (elpaca lua-mode
  (use-package lua-mode))

(elpaca flycheck ;; IF IT DOESN@T WORK RUN META-X FLYCHECK_MODE
(use-package flycheck
     :ensure t
     ;; :defer t
     :init (global-flycheck-mode)
     :config
    (setq flycheck-check-syntax-automatically '(save mode-enabled idle-change))
    (setq flycheck-idle-change-delay 0.5)
    (setq flycheck-python-pylint-executable "pylint"))
       )

(require 'python)
  (setq python-shell-interpreter "python3")  ;; or "python" depending on your system
(setq python-shell-interpreter-args "")
(setq flycheck-python-pylint-executable "pylint")  ;; Make sure it points to your pylint

(elpaca company
  (use-package company
    :defer 2
    :diminish
    :custom
    (company-begin-commands '(self-insert-command))
    (company-idle-delay .1)
    (company-minimum-prefix-length 2)
    (company-show-numbers t)
    (company-tooltip-align-annotations 't)
    (global-company-mode t))
  )
  
(elpaca company-box
(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))
)
