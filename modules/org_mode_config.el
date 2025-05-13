(elpaca toc-org
  (use-package toc-org
    :commands toc-org-enable
    :init
    (add-hook 'org-mode-hook 'toc-org-enable)))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(electric-indent-mode -1)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
