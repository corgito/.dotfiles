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
 '(auto-dark--allow-osascript t)
 '(auto-dark--dark-theme 'spacemacs-dark)
 '(auto-dark--light-theme 'spacemacs-light)
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
   '("f8165eb2a2223c1254a1725dfe169ebd5a35deab2cae3d36e76e507034f23df6" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-agenda-files
   '("~/Dropbox/Projects/Pulse Analyzer/Pulse Analyzer TODO.org" "~/Dropbox/Notes/Polska.org" "~/Dropbox/Notes/personal.org" "~/Documents/Work/chn.org" "~/Documents/tweetparser.org"))
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(ox-gfm flycheck company-quickhelp mu4e vertico olivetti zen-mode google-translate elfeed nov pdf-tools vterm auto-dark csv-mode blacken magit elpy multiple-cursors expand-region mark-multiple swiper popup-kill-ring projectile org-roam diminish spaceline company all-the-icons dashboard rainbow-delimiters sudo-edit hungry-delete switch-window rainbow-mode rainbow avy smex ido-vertical-mode org-bullets spacemacs-theme beacon which-key use-package))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 161 :width normal :foundry "nil" :family "Hack Nerd Font Mono")))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
