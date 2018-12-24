;; Manages a local MELPA repository

(require 'package)

;; Constants related to the local MELPA
(defconst cc-use-local-melpa t)
(defconst cc-local-melpa-path (substitute-in-file-name "$HOME/melpa"))

;; Check if there is a MELPA repo at the directory
;; Set cc-local-melpa-available to t if there is
(defvar cc-local-melpa-available (file-directory-p cc-local-melpa-path))

(if (not cc-local-melpa-available)
    (message "CC - Local MELPA not available")
)

(if (and cc-use-local-melpa cc-local-melpa-available)
    (progn
      (add-to-list 'package-archives (cons "melpa-local" (concat cc-local-melpa-path "/packages/")))
      ;;(setq package-archives '(("melpa-local" . "~/melpa/html/")))
      (message "CC - Local MELPA enabled")
    )
)
