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



