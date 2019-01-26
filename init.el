

;; Loads a file that is under the .emacs.d directory (user-emacs-directory)
;; eg. (cc-load-file "settings/ccelfeed.el")
(defun cc-load-file (relpath)
  (load-file (concat user-emacs-directory relpath))
)

(global-linum-mode 60)   ;; Puts line numbers on the left of every buffer
(display-time-mode 60)   ;; Puts a time display on the bottom
(display-battery-mode 1) ;; Shows the battery at the bottom

(tool-bar-mode -1) ;; Disables the copy icon at the top

;; Sets the shell for M-x shell as bash, Emacs doesn't play well
;; with my shell of choice, fish
(setq-default explicit-shell-file-name "/bin/bash")

;; Make M-up arrow, down arrow act the same as C-up arrow, down arrow
;; Easier to press
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)

;; Makes any links go through EWW instead of your normal browser
;; This is great for RSS feeds through Elfeed
(setq browse-url-browser-function 'eww-browse-url)

;; General Bindings
(global-set-key (kbd "C-c r") 'recenter)

;; Org mode setup
(require 'org)
(when (file-directory-p "~/org-directory")
  (progn
    (message "CC - Org directory found, loading")
    (setq org-directory "~/org-directory")
    (setq org-agenda-files '("~/org-directory"))
    )
  )

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; Add our local MELPA (if available)
(cc-load-file "localmelpa/cclocalmelpa.el")
(package-initialize)

;; Install local MELPA packages
(cc-load-file "localmelpa/lmpackages.el")

;; This turns on company-mode in all buffers if installed
(if (package-installed-p 'company)
    (progn
      (add-hook 'after-init-hook 'global-company-mode)
      (message "CC - Company enabled")
      )
    (message "CC - Company not installed")
)

;; Enables yasnippet in all buffers if installed
(if (package-installed-p 'yasnippet)
    (progn
      (yas-global-mode 1)
      (global-set-key (kbd "C-c y") 'yas-new-snippet)
      (message "CC - Yasnippet enabled")
      )
    (message "CC - Yasnippet not installed")
)

;; Enables projectile in all buffers if installed
(if (package-installed-p 'projectile)
    (progn
      (projectile-global-mode +1)
      (define-key projectile-mode-map (kbd "C-c s") 'projectile-command-map)
      (message "CC - Projectile enabled")
      )
    (message "CC - Projectile not installed")
)

;; Enables Anzu (search counter) if installed
(if (package-installed-p 'anzu)
    (progn
      (global-anzu-mode +1)
      (message "CC - Anzu enabled")
      )
    (message "CC - Anzu not installed")
)

;; Magit keybindings
(if (package-installed-p 'magit)
    (progn
      (global-set-key (kbd "C-c M-c") 'magit-commit)
      (global-set-key (kbd "C-c M-s") 'magit-stage-file)
      (global-set-key (kbd "C-c M-p") 'magit-push-to-remote)
      (message "CC - Magit enabled")
      )
    (message "CC - Magit not installed")
)

;; Elfeed feeds
(if (package-installed-p 'elfeed)
    (progn
      (cc-load-file "settings/ccelfeed.el")
      (message "CC - Elfeed enabled")
      )
  (message "CC - Elfeed not installed")
)

;; Do any Hydra loading if installed
(if (package-installed-p 'hydra)
    (progn
      (cc-load-file "settings/cchydra.el")
      (message "CC - Hydra enabled")
      )
  (message "CC - Hydra not installed")
)

;; Initialize MELPA only packages
(if (package-installed-p 'aggressive-indent)
    (progn
      (global-aggressive-indent-mode 1)
      ;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
      (message "CC - Aggressive Indent enabled")
      )
  (message "CC - Aggressive Indent not installed")
)

(if (package-installed-p 'ws-butler)
    (ws-butler-global-mode)
  )

(if (package-installed-p 'helm)
    ;;(require 'helm-config)
    (progn
      (global-set-key (kbd "M-x") 'helm-M-x)
      (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
      (global-set-key (kbd "C-x C-f") 'helm-find-files)
      (helm-mode 1) ;; Enable globally
      )
  )

(when (package-installed-p 'company-math)
  (progn
    (add-to-list 'company-backends 'company-math-symbols-latex)
    )
  )

(when (package-installed-p 'haskell-mode)
  (defalias 'haskell 'haskell-session-change)
  )

(when (package-installed-p 'flycheck-pos-tip)
  (flycheck-pos-tip-mode)
  )
