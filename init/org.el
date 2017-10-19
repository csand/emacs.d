;;; org.el --- Org-mode config and enhancements

(use-package org
  :mode ("\\.org\\'" . org-mode))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package evil-org
  :after org
  :pin melpa
  :config
  ;; (setq evil-org-special-o/O t)
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook (lambda () (evil-org-set-key-theme))))

(setq org-directory "~/Dropbox/Org"
      org-default-notes-file (concat org-directory "/inbox.org")
      org-agenda-files (concat org-directory "/agenda.org")
      org-export-coding-system 'utf-8
      org-src-tab-acts-natively t
      org-tags-column 80)