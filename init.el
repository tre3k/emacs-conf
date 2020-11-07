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

;; See setup.sh
(setq my_package_list (packages))
(while my_package_list
  (add-to-list 'load-path (car my_package_list))            ;; add to list "load-path" list from packages.el file
  (setq my_package_list (cdr my_package_list))
  )

(require 'imenu)                                            ;; imenu
(require 'imenu-list)                                       ;; imenu-list

(require 'popup)
(require 'fuzzy)
(require 'auto-complete)                                    ;; auto-complete

;; --  manual packages -- ;; 
(add-to-list 'load-path "~/.emacs.d/packages/cmake-mode")
(add-to-list 'load-path "~/.emacs.d/packages/tre3k-templates")
(add-to-list 'load-path "~/.emacs.d/packages/project-el")

(require 'cmake-mode)                                       ;; cmake-mode
(require 'tre3k-templates)                                  ;; Just my templates
(require 'project)                                          ;; need for eglot


;; -- Install with help el-get -- ;;
;(add-to-list 'load-path "~/.emacs.d/el-get")       ;; because alredy in packages/packages.el
(require 'el-get)

;; MAGIT:
(el-get 'sync "dash")
(add-to-list 'load-path "~/.emacs.d/el-get/dash")
(el-get 'sync "with-editor")
(add-to-list 'load-path "~/.emacs.d/el-get/with-editor")
(el-get 'sync "transient")
(add-to-list 'load-path "~/.emacs.d/el-get/transient/lisp")
(el-get 'sync "magit")
(add-to-list 'load-path "~/.emacs.d/el-get/magit/lisp")

(require 'magit)

;; EGLOT: (dep: flymake, eldoc, project.el )
(el-get 'sync "flycheck")
(add-to-list 'load-path "~/.emacs.d/el-get/flycheck")
(el-get 'sync "json-rpc")
(add-to-list 'load-path "~/.emacs.d/el-get/json-rpc")
(el-get 'sync "ac-company")
(add-to-list 'load-path "~/.emacs.d/el-get/ac-company")
(el-get 'sync "company-c-headers")
(add-to-list 'load-path "~/.emacs.d/el-get/company-c-headers")
(el-get 'sync "yasnippet")
(add-to-list 'load-path "~/.emacs.d/el-get/yasnippet")
(el-get 'sync "markdown-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/markdown-mode")

(require 'flycheck)
(require 'json-rpc)
(require 'ac-company)
(require 'company-c-headers)
(require 'yasnippet)
(require 'markdown-mode)
(require 'eglot)

;(add-hook 'c-mode-hook 'eglot-ensure)
;(add-hook 'c++-mode-hook 'eglot-ensure)
;(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;(add-hook 'python-mode-hook 'eglot-ensure)


;; Docker
(el-get 'sync "docker")
(add-to-list 'load-path "~/.emacs.d/el-get/docker")
(el-get 'sync "dockerfile-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/dockerfile-mode")
(el-get 'sync "yaml-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/yaml-mode")

(require 'docker)
(require 'dockerfile-mode)
(require 'yaml-mode)
(require 'docker-compose-mode)  ;; from ~/.emacs.d/packages/

;; NAV:
(el-get 'sync "nav")
(add-to-list 'load-path "~/.emacs.d/el-get/nav")
(require 'nav)

(el-get 'sync "pkgbuild-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/pkgbuild-mode")
(require 'pkgbuild-mode)

;; ------------ Start packages ------------ ;;

(global-company-mode)
(global-auto-complete-mode)                                 ;; enable auto-complete-mode for all buffers

;; ------------ Bind keys:  ------------ ;;
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x c") 'cua-mode)                    ;; block selected 
(global-set-key (kbd "C-x a") 'company-complete-common)
(global-set-key (kbd "C-x r") 'revert-buffer)

(global-set-key (kbd "<C-tab>") 'auto-complete)
(global-set-key (kbd "C-x w") 'whitespace-mode)


(global-set-key (kbd "<f4>") 'ff-find-other-file)           ;; toggle bitwin header and source file

(global-set-key (kbd "<f3>") 'query-replace)                ;; find and replace
;(global-set-key (kbd "<f6>") 'imenu)
(global-set-key (kbd "<f7>") 'imenu-list)
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
   '("b285d537629712a74ab41b1db6b5bd42a446e7835fdd3180bc3eaaa279e6f276" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
