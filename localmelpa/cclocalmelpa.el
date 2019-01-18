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
      (message "CC - Local MELPA available")
    (message "CC - Local MELPA unavailable")))

(defun cc-force-install-local-melpa ()
  "Force installs the local MELPA to the package archives
   Auto-run when cclocalmelpa.el is loaded if
   cc-use-local-melpa and cc-local-melpa-available are t"
  (add-to-list 'package-archives (cons "melpa-local" (concat cc-local-melpa-path "/packages/")))
  ;;(setq package-archives '(("melpa-local" . "~/melpa/html/")))
  (message "CC - Local MELPA installed to package-archives")
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
