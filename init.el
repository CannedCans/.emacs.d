(package-initialize)

(global-linum-mode 60)   ;; Puts line numbers on the left of every buffer
(display-time-mode 60)   ;; Puts a time display on the bottom
(display-battery-mode 1) ;; Shows the battery at the bottom

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

;; This turns on company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)
