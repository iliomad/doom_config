;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Eoin McCarthy"
      user-mail-address "eoin@iliomad.com")

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
(setq doom-font (font-spec :family "monospace" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(after! org
  ;; Set org directory
  (setq org-directory "~eoin/Dropbox/Org")
  ;; Set agenda files
  (setq org-agenda-files (list (concat org-directory "/" "Todos")))
  ;; Set archive location
  (setq org-archive-location (concat org-directory "/" "Archive"))
  ;; Set task states
  (setq org-todo-keywords
        (quote ((sequence "SHAPE(p!)" "TODO(t!)" "NEXT(n!)" "SCHEDULED(e!)" "STARTED(s!)" "ONHOLD(o@/!)" "WITH(w@/!)" "|" "CANCELLED(c@/!)" "DONE(d@/!)")
                (sequence "MAYBE(m!)" "TODO(t!)" "|" "CANCELLED(c)"))))
  ;; No heads-up for upcoming deadlines
  (setq org-deadline-warning-days 0)
)
;;
(setq deft-directory "~eoin/Dropbox/Org/Notes")
(setq deft-extensions '("txt" "org" "md"))
(setq deft-recursive t)
;;
(use-package! org-roam
  :commands (org-roam-insert org-roam-find-file org-roam)
  :init
  (setq org-roam-directory "~eoin/Dropbox/Org/Notes")
  (map! :leader
        :prefix "n"
        :desc "Org-Roam-Insert" "i" #'org-roam-insert
        :desc "Org-Roam-Find"   "/" #'org-roam-find-file
        :desc "Org-Roam-Buffer" "r" #'org-roam)
  :config
  (org-roam-mode +1)
)
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
