;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; After modifying run the command ----> 'doom sync' <----


;;;  ..... DOOM DASHBOARD .....
;;
;; set custom banner
;;; Code:
(setq fancy-splash-image "~/Tresors/privat/Bilder/Saved Pictures/logos/emacs_400px.png")
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
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu Nerd Font" :size 15)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq-default line-spacing 0.2)

(use-package ewal-doom-themes)
(setq doom-theme 'doom-spacegrey)
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
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Tresors/organic")
  (org-roam-buffer-position 'right)
  (org-roam-buffer-height 0.06)
  (org-roam-buffer-width 0.15)
  ;; (setq org-roam-index-file "index.org")
  )
;

(after! org-roam
        (map! :leader
            :prefix "r"
            :desc "ROAM toggle buffer" "r" #'org-roam
            :desc "ROAM insert link" "i" #'org-roam-insert
            :desc "ROAM switch buffer" "b" #'org-roam-switch-to-buffer
            :desc "ROAM todays Interdiu" "t t" #'org-roam-dailies-today
            :desc "ROAM yesterdays Interdiu" "t y" #'org-roam-dailies-yesterday
            :desc "ROAM yesterdays Interdiu" "t m" #'org-roam-dailies-tomorrow
            :desc "ROAM find-file" "f" #'org-roam-find-file
            :desc "ROAM open roam key" "k" #'open-roam-key ;; own function (-> 'save keyboard macro as lisp function')
            :desc "httpd-serve-directory" "s" #'httpd-serve-directory
            :desc "ROAM toggle server" "S" #'org-roam-server-mode
            :desc "ROAM show graph" "g" #'org-roam-show-graph
            :desc "ROAM capture" "c" #'org-roam-capture
            :desc "ROAM clear database cache" "d c" #'org-roam-db-clear
            :desc "ROAM build database cache" "d b" #'org-roam-db-build-cache
            :desc "ORG jump to next link" "l" #'org-next-link
            :desc "ORG jump to prev link" "h" #'org-previous-link
            )
        (define-key evil-normal-state-map (kbd "L") 'org-next-link)
        (define-key evil-normal-state-map (kbd "H") 'org-previous-link)
        )

(fset 'open-roam-key
   (kmacro-lambda-form [?/ ?r ?o ?a ?m ?_ ?k ?e ?y return escape ?f ?. return] 0 "%d"))


;;; .....  ORG ROAM SERVER .....
;;
;
;; (require 'org-roam-protocol)
;; (setq httpd-root "/var/www")
;; ;(httpd-start)  ; disabled so that httpd does not automatically start
;; (use-package org-roam-server
;;  :ensure nil
;;  :load-path "~/.doom.d/lisp/org-roam-server")
;; (require 'simple-httpd)
;

(use-package org-roam-server
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))
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

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;
;; Set $DICPATH to "$HOME/Library/Spelling" for hunspell.
(setenv
  "DICPATH"
  (concat (getenv "HOME") "/usr/share/hunspell/"))
;; Tell ispell-mode to use hunspell.
(setq
  ispell-program-name
  "/usr/local/bin/hunspell")



;;; ........ yas snippet ........
;;
;
(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook (lambda ()
                                 (yas-activate-extra-mode 'fundamental-mode)))

;;; config.el ends here
