;;; +org.el -*- lexical-binding: t; -*-

(setq my-inbox-file (concat org-directory "inbox.org"))
(setq my-todo-file (concat org-directory "todo.org"))
(setq my-projects-file (concat org-directory "projects.org"))
(setq my-someday-file (concat org-directory "someday.org"))

(map!
 :map doom-leader-map
 :leader
 :desc "Org Capture" :mnvo "X" #'(lambda () (interactive) (org-capture nil "c")))

(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)")))

  (setq org-capture-templates
        '(("c" "Capture" entry (file my-inbox-file) "* TODO %?\n")))

  (setq org-refile-targets '((my-todo-file :todo . "")
                             (my-todo-file :todo . "TODO")
                             (my-someday-file :todo . ""))))
