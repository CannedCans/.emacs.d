;; Manages a local MELPA repository

(require 'package)

;; Constants related to the local MELPA
(defconst cc-use-local-melpa t)
(defconst cc-local-melpa-path (substitute-in-file-name "$HOME/melpa"))
;; The path for package-archives
(defconst cc-local-melpa-use-path (concat cc-local-melpa-path "html"))

;; Check if there is a MELPA repo at the directory
;; Set cc-local-melpa-available to t if there is
(defvar cc-local-melpa-available (file-directory-p cc-local-melpa-path))

(if (not cc-local-melpa-available)
    (message "CC - Local MELPA not available")
)

(if (and cc-use-local-melpa cc-local-melpa-available)
    (progn
      ;;((add-to-list package-archives '("melpa-local" . (concat cc-local-melpa-path "html"))))
      ;;(add-to-list package-archives '("melpa-local" . (cons 'cc-local-melpa-use-path)))
      ;; (setq package-archives
      ;;  	    '(("melpa-local" . 'cc-local-melpa-use-path)
      ;;  	       ("gnu" . "http://elpa.gnu.org/packages/")
      ;;  	       ))
      (add-to-list 'package-archives (cons "melpa-local" (concat cc-local-melpa-path "/html")))
      (message "CC - Local MELPA enabled")
    )
)
