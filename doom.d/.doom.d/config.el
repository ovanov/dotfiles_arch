;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; After modifying run the command ----> 'doom sync' <----


;;;  ..... DOOM DASHBOARD .....
;;
;; set custom banner
;
(setq fancy-splash-image "~/Tresors/privat/Bilder/Saved Pictures/logos/emacs_300px.png")
;



;;;  ..... FONTS .....
;;
;; set font
;
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;
(setq doom-font (font-spec :family "Cousine Nerd Font Mono" :size 15))
(setq-default line-spacing 0.2)

(use-package ewal-doom-themes)
(setq doom-theme 'ewal-spacemacs-modern)
;




;;; ..... CENTAUR-TABS .....
;;
;;  tabs, that make working in directories easier
;
(setq centaur-tabs-height 17)
(setq centaur-tabs-group-by-projectile-project t)
(setq centaur-tabs-set-close-button nil)
(setq centaur-tabs-set-modified-marker "*")
(setq centaur-tabs-set-bar 'under)
;




;;; .....  EVIL-MULTIEDIT .....
;;
;; find the same matches
;
(global-set-key (kbd "M-c") 'comment-line)

(use-package evil-multiedit)
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

; match downwards
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

; match upwards
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

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
;




;;;; -----> ORG <-----
;;;
;;
;
;;; .....  ORG SUPERSTAR .....
;;  Rolls Royce feeling
;
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(after! org (setq org-hide-emphasis-markers t))
;



;;; .....  ORG AGENDA .....
;;
; sync' after modifying this file!
;
(setq org-agenda-files (directory-files-recursively "~/Tresors/organic/Uni" "\.org$"))

; If you use `org' and don't want your org files in the default location below,
; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

; This determines the style of line numbers in effect. If set to `nil', line
; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;



;;; .....  ORG ROAM .....
;;
;
(use-package org-roam
     :custom
     (org-roam-directory "~/Tresors/organic")
     )
;




;;; .....  ORG ROAM SERVER .....
;;
;
(require 'org-roam-protocol)
(setq httpd-root "/var/www")
;;(httpd-start)  ; disabled so that httpd does not automatically start
(use-package org-roam-server
  :ensure nil
  :load-path "~/.doom.d/lisp/org-roam-server")
(require 'simple-httpd)
;




;;; .....  DEFT .....
;;  a tool for finding files
;
(use-package deft
  :commands (deft)
  :config (setq deft-directory "~/Tresors/organic"
                deft-extensions '("md" "org")))
;


;;; .....  VEAL-QUIT .....
;; like doom messages, but better
;
(load! "lisp/veal-quit/veal-quit")
;

;;; ..... Company mode fix .....
;; adjusting the call of company
;
(after! python
  (set-company-backend! 'python-mode 'company-jedi))

;
