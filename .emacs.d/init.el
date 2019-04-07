;; ---------------------------------------------------
;; Visuals
;; ---------------------------------------------------
;; Disable menu-bar, tool-bar, scroll-bars... if they exist.
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode) (horizontal-scroll-bar-mode -1))

;; Show line numbers.
(linum-mode 1)

;; Set cursor to I-beam.
(modify-all-frames-parameters (list (cons 'cursor-type 'bar)))

;; The best built-in theme.
(load-theme 'wombat)

;; ---------------------------------------------------
;; Packages
;; ---------------------------------------------------
(require 'package)

;; From https://melpa.org/#/getting-started
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Add parts of each file's directory to the buffer name if not unique.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ---------------------------------------------------
;; Sane defaults
;; ---------------------------------------------------
;; <3.
(setq c-default-style "k&r")

;; Show cursor position within line.
(setq column-number-mode 1)

;; When you have a selected text, typing overwites it.
(setq delete-selection-mode 1)

;; Show unfinished commands after seconds.
(setq echo-keystrokes 0.1)

;; Auto insert closing bracket.
(setq electric-pair-mode 1)

;; Append a newline at the end of the file if it lacks one.
(setq require-final-newline t)

;; Save minibuffer history.
(setq savehist-mode 1)

;; Make Emacs understand sentences end with a single space.
(setq sentence-end-double-space nil)

;; Turn on bracket match highlight.
(setq show-paren-mode 1)

;; Don't soft-wrap lines.
;; (setq truncate-lines 1)

;; UTF-8 as default encoding.
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Type y/n instead of yes/no.
(defalias 'yes-or-no-p 'y-or-n-p)
