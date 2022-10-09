(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq display-time-24hr-format t)
(display-time-mode 1)

(setq ring-bell-function 'ignore)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

;; org mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-directory "~/Dropbox/Notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
 (use-package org-roam
     :ensure t
     :config
     (setq org-roam-directory (file-truename "~/Dropbox/org-roam"))
     (org-roam-db-autosync-mode)
     (add-to-list 'display-buffer-alist
		       '("\\*org-roam\\*"
			 (display-buffer-in-direction)
			 (direction . right)
			 (window-width . 0.33)
			 (window-height . fit-window-to-buffer)))
     (setq org-roam-mode-section-functions
		(list #'org-roam-backlinks-section
		      #'org-roam-reflinks-section
		      ;; #'org-roam-unlinked-references-section
		      ))
     :bind (("C-c n l" . org-roam-buffer-toggle)
	      ("C-c n f" . org-roam-node-find)
	      ("C-c n i" . org-roam-node-insert)
	      ("C-c n c" . org-roam-capture)
	      :map org-mode-map
	      ("C-M-i" . completion-at-point)))


;;theme
(use-package doom-themes
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(load-theme 'doom-gruvbox)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
			       (agenda . 10)
			       (bookmarks . 5)
			       ))
  (setq dashboard-startup-banner "~/Dropbox/small_lain.png")
  (setq dashboard-banner-logo-title "Welcome to Emacs!"))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))
(setq completion-ignore-case  t)

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Dropbox/org/journal/"
        org-journal-date-format "%A, %d %B %Y"))
(visual-line-mode t)

;; place backups in their own directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
     backup-by-copying t  ; don't delink hardlinks
     delete-old-versions t  ; automatically delete excess backups
     )

;;logical scrolling
(setq scroll-conservatively 100)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" default))
 '(package-selected-packages
   '(org-journal vertico dashboard which-key doom-themes org-roam use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
