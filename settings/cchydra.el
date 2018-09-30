;; For Hydra related things

(defhydra hydra-buffer-manipulation (global-map "<f2>")
  "Manipulate buffers easily"
  ("u" upcase-word)
  ("l" downcase-word)
  ("t" transpose-words)

  ;; NAVIGATION so that we don't break out of the Hydra
  ("<right>" right-word)
  ("<left>" left-word)
  ("<up>" previous-line)
  ("<down>" next-line)
)
