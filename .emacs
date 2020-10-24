(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tre3k-dark))
 '(custom-safe-themes
   '("297417ff0a750d66e97f75460fdf2dc42561aac15ac263cfd9a8a2486edf2921" default)))

;; show number lines
(global-linum-mode 1)
;; hide toolbar
(tool-bar-mode 0)
;; disable menu
(menu-bar-mode 0)
;; disable scrollbar
(scroll-bar-mode 0)
;; disable blink cursor
(blink-cursor-mode 0)

;; good buufer shower
(setq redisplay-dont-pause t)
;; global clipboard with OS
(setq x-select-enable-clipboard t)

;; show clock
(display-time-mode 1)
;; d'not show welcome window
(setq inhibit-splash-screen t)

;; moving through windows Shift+<arrow>
(windmove-default-keybindings)

;; d'not save backup
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;; scroll settings
(setq scroll-step 1)                                        ;; up-down one line
(setq screoll-margin 10)                                    ;; 10 lines to end of window
(setq scroll-conservatively 10000)

;; hightlight breces
(show-paren-mode t)
;;(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)

;; 4 spaces as tabulation
;;(c-set-offset 'defun-block-intro 4)
(setq c-default-style "linux" c-basic-offset 4)

;; d'not break line
(set-default 'truncate-lines t)

;; ------------ Requery packages:  ------------ ;;
;; load paths with packages:
(add-to-list 'load-path "~/.emacs.d/imenu-list")            ;; imenu-list
(add-to-list 'load-path "~/.emacs.d/popup-el")              ;; need for auto-complete
(add-to-list 'load-path "~/.emacs.d/fuzzy-el")              ;; need for auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")         ;; auto-complete

;; require
(require 'imenu)                                            ;; imenu
(require 'imenu-list)                                       ;; imenu-list

(require 'popup)
(require 'fuzzy)
(require 'auto-complete)                                    ;; auto-complete

(global-auto-complete-mode)                                 ;; enable auto-complete-mode for all buffers

;;  ------------ Bind keys:  ------------ ;;
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)

(global-set-key (kbd "<f6>") 'imenu)
(global-set-key (kbd "<f7>") 'imenu-list)
(global-set-key (kbd "<f8>") 'imenu-list-smart-toggle)

