(setq frame-resize-pixelwise t)
;; Load configuration modules
(defun load-config-module (module)
  "Load an org configuration module from the modules directory."
  (org-babel-load-file 
   (expand-file-name (format "modules/%s.org" module) user-emacs-directory)))

(load-config-module "elpaca-setup")
(load-config-module "buffer-move")
(load-config-module "evil-config")
(load-config-module "keybindings")
(load-config-module "reload-emacs")
(load-config-module "shells_and_terms")
(load-config-module "fonts")
(load-config-module "gui_adjustments")
(load-config-module "ivy_and_counsel")
(load-config-module "org_mode_config")
(load-config-module "sudo_edit_config")
(load-config-module "which_key")
(load-config-module "app_launcher")
(load-config-module "projectile_config")
(load-config-module "lang_support")
(load-config-module "navigation_config")
