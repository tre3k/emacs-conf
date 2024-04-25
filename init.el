;; Start my options without theme (theme define in end this file)

;; -------------------------- General settings: -----------------------------;;
;; show number lines
(global-display-line-numbers-mode t)
;; hide toolbar
(tool-bar-mode 0)
;; disable menu
(menu-bar-mode 0)
;; disable scrollbar
(scroll-bar-mode 0)
;; disable blink cursor
(blink-cursor-mode 0)

;; vertival line 80 charset
(setq-default display-fill-column-indicator-column 79)

;; good buufer shower
(setq redisplay-dont-pause t)
;; global clipboard with OS
(setq x-select-enable-clipboard t)

;; show clock
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " "))))

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
(setq scroll-step 1)                              ;; up-down one line
(setq screoll-margin 10)                          ;; 10 lines to end of window
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

;; do-not show some warnings
(setq warning-minimum-level :emergency)
;; -------------------------- Requery packages:  --------------------------- ;;
;; load paths with packages:
(add-to-list 'load-path "~/.emacs.d/packages")
(require 'packages)

;; See setup.sh
(setq my_package_list (packages))
(while my_package_list
  ;; add to list "load-path" list from packages.el file
  (add-to-list 'load-path (car my_package_list))
  (setq my_package_list (cdr my_package_list))
  )

(require 'imenu)                                  ;; imenu
(require 'imenu-list)                             ;; imenu-list

(require 'popup)
(require 'fuzzy)
(require 'auto-complete)                          ;; auto-complete
(require 'ligature)
(require 'pulsar)

;; ------------------------  Manual packages: ------------------------------ ;;
(add-to-list 'load-path "~/.emacs.d/packages/cmake-mode")
(add-to-list 'load-path "~/.emacs.d/packages/tre3k-templates")
(add-to-list 'load-path "~/.emacs.d/packages/move-text")

(require 'cmake-mode)                             ;; cmake-mode
(require 'tre3k-templates)                        ;; Just my templates
(require 'move-text)


;; ---------------------------- ELPA --------------------------------------- ;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

;; Project
(package-install 'project)

;; MAGIT:
(package-install 'dash)
(package-install 'with-editor)
(package-install 'transient)
(package-install 'magit)

;; Py-isort
(package-install 'py-isort)

;; Py-yapf (For PEP8 python)
(package-install 'py-yapf)

;; ElDoc
(package-install 'eldoc)
(package-install 'eldoc-eval)
(package-install 'css-eldoc)
(package-install 'c-eldoc)
(package-install 'c-eval)
(package-install 'eldoc-cmake)

;; Haskell:
(package-install 'haskell-mode)
(package-install 'dante)

;; Julia
(package-install 'julia-mode)

;; EGLOT with depends
(package-install 'eglot)
(package-install 'flycheck-eglot)
(package-install 'json-rpc)
(package-install 'company-c-headers)
(package-install 'yasnippet)
(package-install 'markdown-mode)
(package-install 'markdown-preview-mode)
(package-install 'cperl-mode)

;; Go-Lang:
(package-install 'go-mode)

;; Org-mode and etc:
(package-install 'org-tree-slide)

;; AUCTeX:
(package-install 'auctex)

;; NAV:
(package-install 'nav)

;; PKGBUILD mode for ArchLinux package files (makepkg)
(package-install 'pkgbuild-mode)

;; LUA mode:
(package-install 's)
(package-install 'f)

(package-install 'lua-mode)
(package-install 'company-lua)

;; Control mode:
(package-install 'control-mode)

;; Bookmark+:
;; C-x r m - set bookmark
;; C-x j j - jump to bookmark
;; C-x r l - list bookmark (
;;                           o - open in other buffer
;;                           d - mark for delete,  x - accept
;;                           r - rename)

(require 'bookmark+)


;; GnuPLOT:
(package-install 'gnuplot-mode)

;; LaTex:
(package-install 'magic-latex-buffer)
(package-install 'company-math)

(setq TeX-parse-self t)                           ; Enable parse on load.
(setq TeX-auto-save t)                            ; Enable parse on save.
(setq LaTeX-parse-self t)                         ; Enable parse on load.
(setq LaTeX-auto-save t)                          ; Enable parse on save.


;; Vimrc:
(package-install 'vimrc-mode)

;; ---------------------------- Start packages: ---------------------------- ;;

;; enable auto-complete-mode for all buffers
(global-auto-complete-mode)

;; auto highlight bookmarks (bookmark+)
(bmkp-toggle-auto-light-when-jump)
(bmkp-toggle-auto-light-when-set)

(set-face-attribute 'bmkp-light-non-autonamed nil
                   :background "#225222")

(control-mode-default-setup)
(tab-bar-mode)

;; --------------------------- Input method: --------------------------------;;
(set-input-method "russian-typewriter")
(toggle-input-method)

;; ------------------- Calendar localization (russian):  --------------------;;
(setq calendar-week-start-day 1
      calendar-day-name-array ["Воскресенье" "Понедельник" "Вторник" "Среда"
                               "Четверг" "Пятница" "Суббота"]
      calendar-day-header-array ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
      calendar-day-abbrev-array ["Вск" "Пнд" "Втр" "Сре" "Чтв" "Птн" "Суб"]
      calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май"
                                 "Июнь" "Июль" "Август" "Сентябрь"
                                 "Октябрь" "Ноябрь" "Декабрь"]
      calendar-month-abbrev-array ["Янв" "Фев" "Мар" "Апр" "Май" "Июн"
				   "Июл" "Авг" "Сен" "Окт" "Ноя" "Дек"])

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
	(holiday-fixed 11 4 "День Народного единства")
	))

;; ------------------------- Ligature settings ----------------------------- ;;
;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("</" "</>" "/>" "~-" "~-" "~@" "<~" "<~>"
				     "<~~" "~>" "~~" "~~>" ">=" "<=" "<!--"
				     "##" "###" "####" "|-" "-|" "|->" "<-|"
				     ">-|" "|-<" "|=" "|=>" ">-" "<-" "<--"
				     "-->" "->" "-<" ">->" ">>-" "<<-" "<->"
				     "->>" "-<<" "<-<" "==>" "=>" "=/=" "!=="
				     "!=" "<==" ">>=" "=>>" ">=>" "<=>" "<=<"
				     "<<=" "=<<" ".-" ".=" "=:=" "=!=" "=="
				     "===" "::" ":=" ":>" ":<" ">:" ";;" "<|"
				     "<|>" "|>" "<>" "<$" "<$>" "$>" "<+" "<+>"
				     "+>" "?=" "/=" "/==" "/\\" "\\/" "__" "&&"
				     "++" "+++"
				     ))


(global-ligature-mode 't)

;; ------------------------ Org mode settings: ----------------------------- ;;
;; Hot keys
;; C-c C-x C-l              - org-latex-preview
;; C-c .                    - <active date>
;; C-c !                    - [inactive date]
;; C-c C-c                  - toggle checkboks, tags on title
;; C-c C-o                  - open
;; C-c C-t                  - TODO/DONE
;; C-c C-d                  - DEADLINE
;; C-c C-s                  - SHEDULE
;; C-c C-z                  - add note
;; C-c C-x C-v              - org-toggle-inline-images
;; C-c C-l                  - link
;; M-left/rigt/up/down      - move row/columns in table
;; C-c C-x C-i              - start clock
;; C-c C-x C-o              - clock out
;; M-x org-clock-report     - create report about work time


;; Hide some ** / / + + etc
(setq org-hide-emphasis-markers t)
;; List org files for agenda
(setq org-agenda-files '("~/org/main.org"
			 "~/org/private.org"
			 )
      )

;; TODO/DONE/DECLARATE/CANCELED
(setq org-todo-keywords
      '((sequence "TODO" "VERIFY" "LOW" "INPROCESS"
                  "|" "DONE" "DELEGATED" "CANCELED"))
      )

;; Enable some language for #+BEGIN_SRC evaluation block code
(org-babel-do-load-languages 'org-babel-load-languages
 '((emacs-lisp . nil) (C . t) (python . t) (gnuplot . t)))


;; ---------------------------- Bind keys:  -------------------------------- ;;
(global-set-key (kbd "C-x t") 'toggle-truncate-lines)
(global-set-key (kbd "C-x c") 'cua-mode)
(global-set-key (kbd "C-x a") 'company-complete-common)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(global-set-key (kbd "C-u") 'revert-buffer)
(global-set-key (kbd "C-i") 'indent-region)

(global-set-key (kbd "<C-tab>") 'company-complete)

;; find and replace
(global-set-key (kbd "<f3>") 'query-replace)
;; toggle bitwin header and source file
(global-set-key (kbd "<f4>") 'ff-find-other-file)
(global-set-key (kbd "<f6>") 'imenu-list-smart-toggle)
(global-set-key (kbd "<f7>") 'imenu-list)
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
(global-set-key (kbd "M-g d") 'magit-diff-unstaged)

;; for tab-bar-mode
(global-set-key (kbd "<C-M-tab>") 'tab-bar-switch-to-next-tab)

;; for hs-minor-mode (enable in hook)
(global-set-key (kbd "C-=") 'hs-toggle-hiding)
(global-set-key (kbd "C-c a") 'hs-show-all)
(global-set-key (kbd "C-c h") 'hs-hide-all)

;; need packages/move-text/move-text.el see up
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; ------------------------ Auto mode alist: ------------------------------- ;;
(add-to-list 'auto-mode-alist '("\\.gp\\'" . (lambda() (gnuplot-mode))))
(add-to-list 'auto-mode-alist '("\\.gpi\\'" . (lambda() (gnuplot-mode))))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . (lambda() (gnuplot-mode))))

;; ------------------------------ Hooks: ----------------------------------- ;;
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'flyspell-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

 ;; special symbols view in org mode (as _x ^x \theta etc) 2 C-c C-x \
(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
(add-hook 'org-mode-hook
	  (lambda () (setq org-format-latex-options
			   (plist-put org-format-latex-options :scale 2.0))))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

;; auto enable hs-minor-mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
;; (add-hook 'python-mode-hook 'flycheck-mode)
;; (add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'javascript-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)

;; for MaGit auto refresh after save
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-refresh-all))

;; EGLOT key
(add-hook 'eglot--managed-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c r") 'eglot-rename)))

;; Latex-mode
(add-hook 'latex-mode-hook 'reftex-mode)
(add-hook 'bibtex-mode-hook 'reftex-mode)

;; show fill column indicator in programming mode
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

;; ElDoc C/C++
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

(add-hook 'after-init-hook 'global-company-mode)

;; Calendar
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(add-hook 'calendar-today-visible-hook 'calendar-mark-holidays)

;; -------------------------------- TAGS: ---------------------------------- ;;
;; etags ./*.cpp ./*.h из системы, содаст файл TAGS с тегами
;; M-. переход от декларации к функции/переменной
;; M-, переход от функции/переменной к декларации
;; M-? поиск переменной/функции в файлах

;; (defun create-tags (dir-name)
;;   "Create tags file."
;;   (interactive "DDirectory: ")
;;   (eshell-command
;;    (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

;; -------------------------- End of my editing: --------------------------- ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/kirill/.emacs.d/bookmarks")
 '(custom-enabled-themes '(tre3k-dark tre3k-light))
 '(custom-safe-themes
   '("fb3e371b23dbb84a0022bb346c3f0ee89bc6031cda9d79dc2d31b50b9df7fef8" "61594dbfc85a3042684f0abc283d187232166cc32b960a9db3240c58da59b9fd" default))
 '(package-selected-packages
   '(vimrc-mode company-math magic-latex-buffer gnuplot-mode control-mode company-lua lua-mode f s pkgbuild-mode nav auctex org-tree-slide go-mode cperl-mode markdown-preview-mode markdown-mode yasnippet company-c-headers json-rpc flycheck-eglot eglot julia-mode dante haskell-mode eldoc-cmake c-eval c-eldoc css-eldoc eldoc-eval eldoc py-yapf py-isort magit transient with-editor dash project))
 '(send-mail-function 'sendmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
