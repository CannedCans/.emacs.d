;; Installs packages provided by the local MELPA
;; Must be run after (package-initialize) and the local MELPA initialization

;; Set the packages to be installed in this list
(setq cc-local-melpa-package-list '(
				    multiple-cursors
				    aggressive-indent
				    ws-butler
				    mediawiki
				    haskell-mode
				    helm
				    helm-org-rifle

				    ;; Packages from the Debian
				    ;; migration are after here
				    magit
				    company
				    ))

;; This can probably be seriously cleaned up
(if (and cc-use-local-melpa cc-local-melpa-available)
    (dolist (packagea cc-local-melpa-package-list)
      (unless (package-installed-p packagea)
	(package-install packagea))
      (require packagea))
  (if cc-use-local-melpa
      ;; If we have no local melpa available but want to use it
      ;; This will try to check the locally installed packages
      ;; and require them if available
      (dolist (packagea cc-local-melpa-package-list)
	(when (package-installed-p packagea)
	  (require packagea))))

  )
