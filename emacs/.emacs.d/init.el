(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;;;
(require 'org)
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   '("613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" default))
 '(org-agenda-custom-commands
   '(("A" "Agenda and all upcoming appointments"
      ((agenda "" nil)
       (tags "APPOINTMENT" nil))
      nil)))
 '(org-agenda-files
   '("~/Sync/Butternut/board.org" "/Users/nicolaihaddal/Sync/Butternut/butternut.org" "/Users/nicolaihaddal/Dropbox/Work/2022 Human Needs Hero/2022_Human_Needs_Hero_Notes.org" "/Users/nicolaihaddal/Dropbox/Notes/CHN.org" "/Users/nicolaihaddal/Dropbox/Job Hunt/application_tracker.org" "/Users/nicolaihaddal/Dropbox/Notes/personal.org"))
 '(org-capture-templates
   '(("p" "Personal templates")
     ("pt" "TODO entry" entry
      (file+headline "~/Dropbox/Notes/personal.org" "Capture")
      (file "~/Dropbox/org/tpl-todo.txt"))
     ("pj" "Journal entry" entry
      (file+olp+datetree "~/Dropbox/org/journal.org")
      "* %U - %^{Activity}")
     ("pg" "Guitar journal entry" entry
      (file+olp+datetree "~/Dropbox/Guitar/guitar_diary.org")
      "* %U - %^{Activity}")
     ("w" "Work templates")
     ("wt" "TODO entry" entry
      (file+headline "~/Dropbox/Notes/CHN.org" "Capture")
      (file "~/Dropbox/org/tpl-todo.txt"))
     ("wh" "Heroes TODO entry" entry
      (file+headline "~/Dropbox/Work/2022 Human Needs Hero/2022_Human_Needs_Hero_Notes.org" "Capture")
      (file "~/Dropbox/org/tpl-todo.txt"))
     ("ww" "Webinar entry" entry
      (file+headline "~/Dropbox/Notes/CHN.org" "Capture")
      (file "~/Dropbox/org/webinar-todo.txt"))))
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(org-log-into-drawer t)
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-targets '((org-agenda-files :tag . ":maxlevel . 2")))
 '(org-refile-use-outline-path 'file)
 '(package-selected-packages
   '(centaur-tabs eglot lsp-ui dap-mode lsp-ivy lsp-treemacs lsp-mode python-mode yasnippet-snippets god-mode htmlize chocolate-theme org-modern iedit wrap-region markdown-mode doom-modeline doom-themes ox-gfm flycheck company-quickhelp mu4e vertico olivetti zen-mode google-translate elfeed nov pdf-tools vterm auto-dark csv-mode blacken magit elpy multiple-cursors expand-region mark-multiple swiper popup-kill-ring projectile org-roam diminish spaceline company all-the-icons dashboard rainbow-delimiters sudo-edit hungry-delete switch-window rainbow-mode rainbow avy smex ido-vertical-mode org-bullets spacemacs-theme beacon which-key use-package))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(warning-suppress-log-types '(((python python-shell-completion-native-turn-on-maybe)))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :extend nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 161 :width normal :foundry "nil" :family "Hack Nerd Font Mono")))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
