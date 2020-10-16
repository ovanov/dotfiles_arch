;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;;(setq redisplay-dont-pause t
;;  scroll-margin 1
;;  scroll-step 1
;;  scroll-conservatively 10000
;;  scroll-preserve-screen-position 1)




(load! "lisp/veal-quit/veal-quit")

;; ------------------General key-binds----------------------
(global-set-key (kbd "M-c") 'comment-line)

(use-package evil-multiedit)

;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an editregion). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev)

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)

;; --- doom dashboard ---
;; set custom banner
(setq fancy-splash-image "~/Tresors/privat/Bilder/Saved Pictures/logos/emacs_300px.png")


;; ----------- Import ics-file and make a diary-------------
;; (icalendar-import-file "/mnt/c/Users/lukaj/My Tresors/sync_stuff/calendar_ics_files/calendar_outlook.ics"
;;                        "/mnt/c/Users/lukaj/My Tresors/sync_stuff/doom_stuff/diaries/outlook_diary")



;; sync' after modifying this file!
(setq org-agenda-files (directory-files-recursively "~/Tresors/organic/Uni" "\.org$"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Luka Jovanovic"
      user-mail-address "luka.jovanovic@outlook.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Cousine Nerd Font Mono" :size 15))
(setq-default line-spacing 0.2)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(use-package ewal-doom-themes)
(setq doom-theme 'ewal-spacemacs-modern)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; ------- org-roam -------
;;
(use-package org-roam
     :custom
     (org-roam-directory "~/Tresors/organic")
     )
;;
;; ------- org-roam-server -------
(require 'org-roam-protocol)
(setq httpd-root "/var/www")
;;(httpd-start)  ; disabled so that httpd does not automatically start
(use-package org-roam-server
  :ensure nil
  :load-path "~/.doom.d/lisp/org-roam-server")
(require 'simple-httpd)
;;
;;
;; ------- deft --------
(use-package deft
  :commands (deft)
  :config (setq deft-directory "~/Tresors/organic"
                deft-extensions '("md" "org")))
;;

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(after! org (setq org-hide-emphasis-markers t))


;; ------ centaur tabs--
(setq centaur-tabs-height 17)
(setq centaur-tabs-group-by-projectile-project t)
(setq centaur-tabs-set-close-button nil)
(setq centaur-tabs-set-modified-marker "*")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
