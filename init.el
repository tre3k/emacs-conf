;; Start my options without theme (theme define in end this file)
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
;(setq auto-save-default t)
(setq auto-save-list-file-name nil)

;; scroll settings
(setq scroll-step 1)                                        ;; up-down one line
(setq screoll-margin 10)                                    ;; 10 lines to end of window
(setq scroll-conservatively 10000)

;; hightlight breces
(show-paren-mode t)
;(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)

;; 4 spaces as tabulation
;;(c-set-offset 'defun-block-intro 4)
(setq c-default-style "linux" c-basic-offset 8)

;; d'not break line
(set-default 'truncate-lines t)

;; ------------ Requery packages:  ------------ ;;
;; load paths with packages:
(add-to-list 'load-path "~/.emacs.d/packages")
(require 'packages)

(setq my_package_list (packages))
(while my_package_list
  (add-to-list 'load-path (car my_package_list))    ;; add to list "load-path" list from packages.el file
  (setq my_package_list (cdr my_package_list))
  )


;; install with help el-get
(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)

;; MaGIT:
(add-to-list 'load-path "~/.emacs.d/el-get/dash")
(add-to-list 'load-path "~/.emacs.d/el-get/with-editor")
(add-to-list 'load-path "~/.emacs.d/el-get/transient/lisp")
(add-to-list 'load-path "~/.emacs.d/el-get/magit/lisp")


(require 'imenu)                                            ;; imenu
(require 'imenu-list)                                       ;; imenu-list

(require 'popup)
(require 'fuzzy)
(require 'auto-complete)                                    ;; auto-complete

(require 'cmake-mode)                                       ;; cmake-mode
(require 'magit)

(require 'tre3k-templates)                                  ;; Just my templates

;; ------------ Start packages ------------ ;;

(global-auto-complete-mode)                                 ;; enable auto-complete-mode for all buffers

;; ------------ Bind keys:  ------------ ;;
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x c") 'cua-mode)                    ;; block selected 
(global-set-key (kbd "C-x a") 'auto-complete-mode)
(global-set-key (kbd "C-x r") 'revert-buffer)

(global-set-key (kbd "<C-tab>") 'auto-complete)
(global-set-key (kbd "C-x w") 'whitespace-mode)


(global-set-key (kbd "<f4>") 'ff-find-other-file)           ;; toggle bitwin header and source file

(global-set-key (kbd "<f3>") 'query-replace)                ;; find and replace
;(global-set-key (kbd "<f6>") 'imenu)
;(global-set-key (kbd "<f7>") 'imenu-list)
(global-set-key (kbd "<f6>") 'imenu-list-smart-toggle)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key (kbd "<f9>") 'recompile)

(global-set-key (kbd "M-g c") 'magit-commit-create)
(global-set-key (kbd "M-g l") 'magit-log-all)
(global-set-key (kbd "M-g s") 'magit-status)



;; ------------ End of my editing ------------ ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tre3k-dark))
 '(custom-safe-themes
   '("b285d537629712a74ab41b1db6b5bd42a446e7835fdd3180bc3eaaa279e6f276" "0c8c8687f2c82dd02a664e1d05007ae33b59f4ef9060e0c53db87529dad719ad" default))
 '(package-selected-packages '(dash)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
