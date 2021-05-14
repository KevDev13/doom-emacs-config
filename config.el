;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Kevin Garner"
      user-mail-address "kevin@kgar.net")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;(setq doom-font (font-spec :family "monospace" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

; define variables
(defvar max-line-width 120)
(defvar tab-indent-default 4)
(defvar tab-indent-c tab-indent-default)

; uncomment this if you ever have to use spaces over tabs
;(setq indent-tabs-mode nil)

; set default window size
(if (display-graphic-p)
	(progn
	  (setq initial-frame-alist
			'(
			  (width . 132) ; width in characters
			  (height . 40) ; height in lines
			  ))))

; set default tab size
(setq-default tab-width tab-indent-default)
(setq-default c-basic-offset tab-indent-c)

(setq undo-limit 80000000       ; Raise undo-limit to 80Mb
      evil-want-fine-undo t     ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t)      ; auto-save please

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;(global-set-key [f5] 'revert-buffer) ; use this to press key to revert on external changes (i.e. git)
(global-auto-revert-mode 1) ; use this to auto-revert on external changes (i.e. git)
(global-set-key [(control c) (a)] 'company-complete) ; initiate manual completion via company
(global-set-key [(control c) (t)] 'term) ; open new terminal

; org-mode uses auto-fill-mode
(setq-default fill-column max-line-width) ; not 70 chars per line
(add-hook 'org-mode-hook 'turn-on-auto-fill)

; set EOL characters to *nix so we have LF even when working on Windows
(setq default-buffer-file-coding-system 'utf-8-unix)

; always enable company mode
(add-hook 'after-init-hook 'global-company-mode)

; Rust stuff
(require 'rust-mode) ; require rust-mode
(add-hook 'rust-mode-hook ; when in Rust, no using tabs, sadly...
          (lambda () (setq indent-tabs-mode nil)))
