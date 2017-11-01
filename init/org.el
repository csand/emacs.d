;;; org.el --- Org-mode config and enhancements

(defvar org-directory "~/Dropbox/Org")

(defun org-file (filename)
  (expand-file-name filename org-directory))

(defvar org-agenda-file (org-file "agenda.org"))
(defvar org-inbox-file  (org-file "inbox.org"))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :init
  (progn
    (setq org-agenda-files `(,org-agenda-file ,org-inbox-file)
          org-export-coding-system 'utf-8
          org-refile-targets '((nil :maxlevel . 9)
                               (org-inbox-file :level . 1))
          org-src-tab-acts-natively t
          org-startup-folded nil
          org-tags-column 80)
    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline org-inbox-file "Tasks")
             "* TODO %i%?")))
    (add-hook 'org-mode-hook 'auto-fill-mode))
  :config
  (add-to-list 'org-src-lang-modes '("javascript" . js2)))

(use-package evil-org
  :after org
  :diminish evil-org-mode
  :pin melpa
  :init
  (progn
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook 'evil-org-set-key-theme)))
