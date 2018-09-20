(package-initialize)

(global-linum-mode 60)
(display-time-mode 60)
(display-battery-mode 1)

(setq-default explicit-shell-file-name "/bin/bash")

(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<down>") 'forward-paragraph)

(setq browse-url-browser-function 'eww-browse-url)

(add-hook 'after-init-hook 'global-company-mode)
