(defun reload-init-file () ;; 'defun' == 'def' in python
  (interactive) ;; Makes function available using 'M-x' which is 'Alt-x'
  (load-file user-init-file)
  (load-file user-init-file))
