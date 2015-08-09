;;; org-config.el --- config org-mode
(require 'org)

;;; todo-keywords
(setq org-todo-keywords '((type "work(w)" "learn(s)" "play(l)" "|")
                          (sequence "DOING(i)" "PENDING(p)" "TODO(t)" "|" "DONE(d!)" "ABORT(a@/!)")))

(setq org-todo-keyword-faces '(("work" . (:background "red" :foreground "white" :weight bold))
                               ("learn" . (:background "white" :foreground "red" :weight bold))
                               ("play" . (:background "white" :foreground "MediumBlue" :weight bold))
                               ("PENDING" . (:background "LightGreen" :foreground "black" :weight bold))
                               ("DOING" . (:background "Green" :foreground "white" :weight bold))
                               ("TODO" . (:background "DarkOrange" :foreground "black" :weight bold))
                               ("DONE" . (:background "azure" :foreground "Darkgreen" :weight bold))
                               ("ABORT" . (:background "gray" :foreground "black"))))
(setq org-log-done 'time)

;;; priority
(setq org-highest-priority ?A)
(setq org-lowest-priority ?E)
(setq org-default-priority ?E)
(setq org-priority-faces '((?A . (:background "red" :foreground "white" :weight bold))
                           (?B . (:background "DarkOrange" :foreground "white" :weight bold))
                           (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
                           (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
                           (?E . (:background "SkyBlue" :foreground "black" :weight bold))
                           (?F . (:background "LightSkyBlue" :foreground "black" :weight bold))))

;;; taglist
;;(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

;;; dependencies
(setq org-enforce-todo-dependencies t)

;;; agenda
(setq org-agenda-files '("~/org"))
(setq org-agenda-ndays 14)
(setq org-agenda-include-diary t)
(global-set-key (kbd "C-c a") 'org-agenda)

;;; capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+datetree "~/org/task.org")
         "* TODO %^{Decription} %^T %^g\n %i")
        ("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
         "* %A %^g %i")
        ("f" "Someday" entry (file+headline "~/org/task.org" "Someday")
         "* %?")))
(provide 'org-config)
