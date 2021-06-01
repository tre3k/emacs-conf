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

;; highlight of search
(setq search-highlight t)


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

;; Haskell
(add-to-list 'load-path "~/.emacs.d/el-get/haskell-mode")
(el-get 'sync "haskell-mode")
(require 'haskell-mode)

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
(el-get 'sync "c-eldoc")
(add-to-list 'load-path "~/.emacs.d/el-get/c-eldoc")
(el-get 'sync "cperl-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/cperl-mode")

(require 'c-eldoc)
(require 'cperl-mode)
(require 'flycheck)
(require 'json-rpc)
(require 'ac-company)
(require 'company-c-headers)
(require 'yasnippet)
(require 'markdown-mode)
(require 'eglot)

;; Go-Lang
(el-get 'sync "go-mode")
;(el-get 'sync "go-company")
;(el-get 'sync "go-eldoc")
;(el-get 'sync "go-flymake")
;(add-to-list 'load-average "~/.emacs.d/el-get/go-mode")
;(add-to-list 'load-average "~/.emacs.d/el-get/go-company")
;(add-to-list 'load-average "~/.emacs.d/el-get/go-eldoc"
;(add-to-list 'load-average "~/.emacs.d/el-get/go-flymake")

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

;; LUA mode
(el-get 'sync "s")
(el-get 'sync "f")
(add-to-list 'load-path "~/.emacs.d/el-get/s")
(add-to-list 'load-path "~/.emacs.d/el-get/f")
(require 's)
(require 'f)

(el-get 'sync "lua-mode")
(el-get 'sync "flymake-lua")
(el-get 'sync "company-lua")
(add-to-list 'load-path "~/.emacs.d/el-get/lua-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/flymake-lua")
(add-to-list 'load-path "~/.emacs.d/el-get/company-lua")

(require 'lua-mode)
(require 'flymake-lua)
(require 'company-lua)

;; Bookmark+
(el-get 'sync "bookmark+")
(add-to-list 'load-path "~/.emacs.d/el-get/bookmark+")
(require 'bookmark+)

;; C-x r m - set bookmark
;; C-x j j - jump to bookmark
;; C-x r l - list bookmark (
;;                           o - open in other buffer
;;                           d - mark for delete,  x - accept
;;                           r - rename)


;; GnuPLOT
(el-get' sync "gnuplot-mode")
(add-to-list 'load-path "~/.emacs.d/el-get/gnuplot-mode")

;; LaTex
(el-get 'sync "magic-latex-buffer")
(add-to-list 'load-path "~/.emacs.d/el-get/magic-latex-buffer")
(el-get 'sync "company-math")
(add-to-list 'load-path "~/.emacs.d/el-get/company-math")
(require 'magic-latex-buffer)
(require 'company-math)

;; ------------ Start packages ------------ ;;

(global-company-mode)
(global-auto-complete-mode)                                 ;; enable auto-complete-mode for all buffers

;; auto highlight bookmarks (bookmark+)
(bmkp-toggle-auto-light-when-jump)
(bmkp-toggle-auto-light-when-set)

(set-face-attribute 'bmkp-light-non-autonamed nil
		    :background "#225222")

;; ------------- Agenda conf -----------------------;;

(setq org-agenda-files '("~/org/main.org"
			 "~/org/private.org"))

;; -------------- Input method ---------------------;;
(set-input-method "russian-typewriter")
(toggle-input-method)

;; ------------- Calendar localization  ------------;;
(setq calendar-week-start-day 1
          calendar-day-name-array ["Воскресенье" "Понедельник" "Вторник" "Среда" 
                                   "Четверг" "Пятница" "Суббота"]
          calendar-day-header-array ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
          calendar-day-abbrev-array ["Вск" "Пнд" "Втр" "Сре" "Чтв" "Птн" "Суб"]
          calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май" 
                                     "Июнь" "Июль" "Август" "Сентябрь"
                                     "Октябрь" "Ноябрь" "Декабрь"]
          calendar-month-abbrev-array ["Янв" "Фев" "Мар" "Апр" "Май" "Июн" "Июл" "Авг" "Сен" "Окт" "Ноя" "Дек"])

(setq calendar-holidays
      `(
	;; State holidays
	(holiday-fixed 1 1 "Новый год")
	(holiday-fixed 7 1 "Рождество")
	(holiday-fixed 2 23 "День защитника Отечества")
	(holiday-fixed 3 8 "Международный женский день")
	(holiday-fixed 5 1 "День труда")
	(holiday-fixed 5 2 "День труда")
	(holiday-fixed 5 9 "День Победы")
	(holiday-fixed 6 12 "День России")
	(holiday-fixed 10 4 "День Народного единства")
      ))

;; ------------ Org mode settings ----------------- ;;
(setq org-hide-emphasis-markers t)

;; Hot keys
;; C-c C-x C-l org-latex-preview

;; ------------ Bind keys:  ------------ ;;
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x c") 'cua-mode)                    ;; block selected 
(global-set-key (kbd "C-x a") 'company-complete-common)
(global-set-key (kbd "C-u") 'revert-buffer)
(global-set-key (kbd "C-i") 'indent-region)

(global-set-key (kbd "<C-tab>") 'auto-complete)
(global-set-key (kbd "C-x w") 'whitespace-mode)


(global-set-key (kbd "<f4>") 'ff-find-other-file)           ;; toggle bitwin header and source file

(global-set-key (kbd "<f3>") 'query-replace)                ;; find and replace
;(global-set-key (kbd "<f6>") 'imenu)
(global-set-key (kbd "<f7>") 'imenu-list)
(global-set-key (kbd "<f6>") 'imenu-list-smart-toggle)
(global-set-key (kbd "<f8>") 'compile)
(global-set-key (kbd "<f9>") 'recompile)

;; ispell, flyspell hotkeys
(global-set-key (kbd "<f12>") 'ispell-word)

;; MAGIT hot keys
(global-set-key (kbd "M-g c") 'magit-commit-create)
(global-set-key (kbd "M-g l") 'magit-log-all)
(global-set-key (kbd "M-g s") 'magit-status)
(global-set-key (kbd "M-g p") 'magit-push)
(global-set-key (kbd "M-g u") 'magit-pull)
(global-set-key (kbd "M-g o") 'magit-show-commit)

;; for tab-bar-mode
(global-set-key (kbd "M-n") 'tab-bar-switch-to-next-tab)

;; for hs-minor-mode (enable in hook)
(global-set-key (kbd "C-=") 'hs-toggle-hiding)
(global-set-key (kbd "C-c a") 'hs-show-all)
(global-set-key (kbd "C-c h") 'hs-hide-all)


;; ------------- Auto mode alist ------------- ;;
(add-to-list 'auto-mode-alist '("\\.gp\\'" . (lambda() (gnuplot-mode))))
(add-to-list 'auto-mode-alist '("\\.gpi\\'" . (lambda() (gnuplot-mode))))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . (lambda() (gnuplot-mode))))

;; ------------ Hooks ------------ ;;
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)

(add-hook 'org-mode-hook 'org-toggle-pretty-entities) ;; special symbols view (as _x ^x \theta etc) 2 C-c C-x \
(add-hook 'org-mode-hook
	  (lambda () (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))))

;; auto enable hs-minor-mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'javascript-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)

;; (add-hook 'c-mode-hook 'eglot)
;; (add-hook 'c++-mode-hook 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'python-mode-hook 'eglot-ensure)


;; ------------- TAGS -------------- ;;
;; etags ./*.cpp ./*.h из системы, содаст файл TAGS с тегами
;; M-. переход от декларации к функции/переменной
;; M-, переход от функции/переменной к декларации
;; M-? поиск переменной/функции в файлах

;; ------------ End of my editing ------------ ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/kirill/.emacs.d/bookmarks")
 '(custom-enabled-themes '(tre3k-dark))
 '(custom-safe-themes
   '("b285d537629712a74ab41b1db6b5bd42a446e7835fdd3180bc3eaaa279e6f276" "994f6d7b526f1936f6eed424f5e605406cee370061f1ce5ed3f2d01b5a5bccbf" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
