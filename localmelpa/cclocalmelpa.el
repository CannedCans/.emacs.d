;; Manages a local MELPA repository

(require 'package)

;; Constants related to the local MELPA
(defconst cc-use-local-melpa t)
(defconst cc-local-melpa-path (substitute-in-file-name "$HOME/melpa"))

;; Check if there is a MELPA repo at the directory
;; Set cc-local-melpa-available to t if there is
(defvar cc-local-melpa-available (file-directory-p cc-local-melpa-path))

(defun cc-local-melpa-status ()
  "Prints a message to the user if the local MELPA is enabled and installed.
   Also informs the user if it is not available."
  (interactive)
  (if (and cc-use-local-melpa cc-local-melpa-available)
      (message "CC - Local MELPA available and installed")
    (message "CC - Local MELPA unavailable")))

(defun cc-local-melpa-rescan ()
  "Rescans for a local MELPA. Messages the user with it's updated status."
  (interactive)
  (setq cc-local-melpa-available (file-directory-p cc-local-melpa-path))
  (if cc-local-melpa-available
      (message "CC - Local MELPA available to install")
    (message "CC - Local MELPA unavailable to install")))

(defun cc-force-install-local-melpa ()
  "Force installs the local MELPA to the package archives
   Auto-run when cclocalmelpa.el is loaded if
   cc-use-local-melpa and cc-local-melpa-available are t"
  (add-to-list 'package-archives (cons "melpa-local" (concat cc-local-melpa-path "/packages/")))
  ;;(setq package-archives '(("melpa-local" . "~/melpa/html/")))
  (message "CC - Local MELPA installed to package-archives")
  )

(defun cc-update-local-melpa ()
  "Runs ~/.emacs.d/melpa.sh to update the packages in the local MELPA"
  (interactive)
  (if (and cc-use-local-melpa cc-local-melpa-available)
      (async-shell-command "~/.emacs.d/melpa.sh")
    (message "Unable to update the local MELPA")
    )
  )

(if (not cc-local-melpa-available)
    ;; No local MELPA files
    (message "CC - Local MELPA not installed")
  )

(cc-local-melpa-status)
(if (and cc-use-local-melpa cc-local-melpa-available)
    (progn
      (cc-force-install-local-melpa)
      )
  )
