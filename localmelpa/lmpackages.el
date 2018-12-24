;; Installs packages provided by the local MELPA
;; Must be run after (package-initialize) and the local MELPA initialization

;; Set the packages to be installed in this list
(setq cc-local-melpa-package-list '(
multiple-cursors
aggressive-indent
))

(if cc-use-local-melpa
    (dolist (packagea cc-local-melpa-package-list)
      (unless (package-installed-p packagea)
	(package-install packagea))
      (require packagea)))
