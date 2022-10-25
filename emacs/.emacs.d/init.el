(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'org)
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" default))
 '(org-agenda-files '("~/Dropbox/Notes/CHN.org"))
 '(package-selected-packages
   '(hydra counsel edit-server elpy evil-surround vterm undo-tree evil-collection evil evil-mode god-mode zen-mode yasnippet-snippets writeroom-mode wrap-region which-key vertico use-package switch-window swiper sudo-edit smex rainbow-delimiters python-mode projectile popup-kill-ring org-roam org-journal olivetti nov multiple-cursors markdown-mode magit iedit ido-vertical-mode hungry-delete htmlize google-translate flycheck expand-region elfeed eglot doom-themes doom-modeline diminish dashboard csv-mode company-quickhelp beacon avy all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
