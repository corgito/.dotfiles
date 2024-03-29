(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" default))
 '(org-agenda-files
   '("/mnt/c/Users/nhadd/Dropbox/org-roam/20230422193840-mastering_python_second_edition.org" "/home/corgito/Dropbox/notes/email_ai_project.org" "/home/corgito/Dropbox/Notes/unfiltered.org" "/home/corgito/Dropbox/notes/personal.org" "/home/corgito/Dropbox/Notes/CHN.org"))
 '(package-selected-packages
   '(vscode-dark-plus-theme solaire-mode tree-sitter-langs tree-sitter lsp-pyright marginalia pyvenv-auto vterm-toggle pdf-tools hydra counsel edit-server elpy evil-surround vterm undo-tree evil-collection evil evil-mode god-mode zen-mode yasnippet-snippets writeroom-mode wrap-region which-key vertico use-package switch-window swiper sudo-edit smex rainbow-delimiters python-mode projectile popup-kill-ring org-roam org-journal olivetti nov multiple-cursors markdown-mode magit iedit ido-vertical-mode hungry-delete htmlize google-translate flycheck expand-region elfeed eglot doom-themes doom-modeline diminish dashboard csv-mode company-quickhelp beacon avy all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
