;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Nicolai Haddal"
      user-mail-address "nicolai@nicolaihaddal.info")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

(set-face-attribute 'font-lock-comment-face nil :foreground "#5B6268" :slant 'italic)
(set-face-attribute 'font-lock-function-name-face nil :foreground "#c678dd" :slant 'italic)
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#dcaeea" :slant 'italic)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq org-roam-directory "~/Dropbox/org-roam")
'(org-capture-templates
(quote
(("p" "Private templates")
("pj" "Journal entry" entry (file+olp+datetree
"~/Dropbox/org/journal.org") "* %U - %^{Activity}"))))

;; The built-in calendar mode mappings for org-journal
;; conflict with evil bindings
(map!
 (:map calendar-mode-map
   :n "o" #'org-journal-display-entry
   :n "p" #'org-journal-previous-entry
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))



;; display time
(display-time-mode 1)

;; display battery
(display-battery-mode 1)
 ;; load mu4e from the installation path.
   ;; yours might differ check with the Emacs installation
   (use-package mu4e
     :load-path  "/usr/local/share/emacs/site-lisp/mu/mu4e/")
   ;; for sending mails
   (require 'smtpmail)

   ;; we installed this with homebrew
   (setq mu4e-mu-binary (executable-find "mu"))

   ;; this is the directory we created before:
   (setq mu4e-maildir "~/.maildir")

   ;; this command is called to sync imap servers:
   (setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
   ;; how often to call it in seconds:
   (setq mu4e-update-interval 300)

   ;; save attachment to desktop by default
   ;; or another choice of yours:
   (setq mu4e-attachment-dir "~/Desktop")

   ;; rename files when moving - needed for mbsync:
   (setq mu4e-change-filenames-when-moving t)

   ;; list of your email adresses:
   (setq mu4e-user-mail-address-list '("nhaddal@protonmail.com" "nicolai@nicolaihaddal.info"))

   (setq mu4e-contexts
	  `(,(make-mu4e-context
	      :name "protonmail"
	      :enter-func
	      (lambda () (mu4e-message "Enter nhaddal@protonmail.com context"))
	      :leave-func
	      (lambda () (mu4e-message "Leave nhaddal@protonmail.com context"))
	      :match-func
	      (lambda (msg)
		(when msg
		  (mu4e-message-contact-field-matches msg
						      :to "nhaddal@protonmail.com")))
	      :vars '((user-mail-address . "nhaddal@protonmail.com" )
		      (user-full-name . "Nicolai Haddal")
		      (mu4e-drafts-folder . "/protonmail/Drafts")
		      (mu4e-refile-folder . "/protonmail/Archive")
		      (mu4e-sent-folder . "/protonmail/Sent Messages")
		      (mu4e-trash-folder . "/protonmail/Deleted Messages")))))

   ;; Send mail
   (setq message-send-mail-function 'smtpmail-send-it
	    smtpmail-auth-credentials "~/.authinfo"
	    smtpmail-smtp-server "127.0.0.1"
	    smtpmail-smtp-service 1025)
   (setq mu4e-context-policy 'pick-first) ;; start with the first (default) context;
   (setq mu4e-compose-context-policy 'ask) ;; ask for context if no context matches;
   ;; don't keep message compose buffers around after sending:
   (setq message-kill-buffer-on-exit t)

   ;; send function:
   (setq send-mail-function 'sendmail-send-it
	  message-send-mail-function 'sendmail-send-it)

   ;; send program:
   ;; this is exeranal. remember we installed it before.
   (setq sendmail-program (executable-find "msmtp"))

   ;; select the right sender email from the context.
   (setq message-sendmail-envelope-from 'header)

   ;; chose from account before sending
   ;; this is a custom function that works for me.
   ;; well I stole it somewhere long ago.
   ;; I suggest using it to make matters easy
   ;; of course adjust the email adresses and account descriptions
   (defun timu/set-msmtp-account ()
     (if (message-mail-p)
	  (save-excursnion
	    (let*
		((from (save-restriction
			 (message-narrow-to-headers)
			 (message-fetch-field "from")))
		 (account
		  (cond
		   ((string-match "nhaddal@protonmail.com" from) "protonmail")
		   ((string-match "nhaddal@protonmail.com" from) "protonmail")
		   ((string-match "nhaddal@protonmail.com" from) "protonmail"))))
	      (setq message-sendmail-extra-arguments (list '"-a" account))))))

   (add-hook 'message-send-mail-hook 'timu/set-msmtp-account)

   ;; mu4e cc & bcc
   ;; this is custom as well
   (add-hook 'mu4e-compose-mode-hook
	      (defun timu/add-cc-and-bcc ()
		"My Function to automatically add Cc & Bcc: headers.
	This is in the mu4e compose mode."
		(save-excursion (message-add-header "Cc:\n"))
		(save-excursion (message-add-header "Bcc:\n"))))

   ;; mu4e address completion
   (add-hook 'mu4e-compose-mode-hook 'company-mode)

   ;; prefer plainest version of messages
    (with-eval-after-load "mm-decode"
	   (add-to-list 'mm-discouraged-alternatives "text/html")
   (add-to-list 'mm-discouraged-alternatives "text/richtext"))
   ;; attempt to show images when viewing messages
    (setq mu4e-view-show-images t)

   (require 'org-mu4e)

   ;;view email in browser
   (add-to-list 'mu4e-view-actions
     '("ViewInBrowser" . mu4e-action-view-in-browser) t)
