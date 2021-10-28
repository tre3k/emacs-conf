(deftheme tre3k-light
  "Created 2021-10-28.")

(custom-theme-set-faces
 'tre3k-light
 '(default ((t (:family "Victor Mono" :foundry "UKWN" :width normal :height 128 :weight medium :slant normal :underline nil :overline nil :extend nil :strike-through nil :box nil :inverse-video nil :foreground "#070707" :background "#f7f7f7" :stipple nil :inherit nil))))
 '(cursor ((t (:background "#656565"))))
 '(fixed-pitch ((t (:family "Victor Mono"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((t (:weight bold :foreground "#ddaa6f"))))
 '(homoglyph ((t (:weight bold :foreground "#ddaa6f"))))
 '(minibuffer-prompt ((t (:foreground "#e5786d"))))
 '(highlight ((t (:underline nil :foreground "#ffffff" :background "#654545"))))
 '(region ((t (:extend t :foreground "#232323" :background "#c7c7c7"))))
 '(shadow ((t (:foreground "gray40"))))
 '(secondary-selection ((t (:extend t :foreground "#f6f3e8" :background "#333366"))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-builtin-face ((t (:foreground "LightPink4"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "gray50" :slant italic :family "Victor Mono"))))
 '(font-lock-constant-face ((t (:foreground "dark cyan"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-doc-markup-face ((t (:inherit font-lock-constant-face))))
 '(font-lock-function-name-face ((t (:foreground "dark blue"))))
 '(font-lock-keyword-face ((t (:weight extra-bold :foreground "dark magenta"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "brown" :slant italic))))
 '(font-lock-type-face ((t (:weight ultra-bold :slant normal :foreground "#04a040"))))
 '(font-lock-variable-name-face ((t (:foreground "dark red"))))
 '(font-lock-warning-face ((t (:foreground "#ccaa8f"))))
 '(button ((t (:foreground "#070707" :background "#f7f7f7"))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "blue"))))
 '(link-visited ((t (:underline (:color foreground-color :style line) :foreground "#e5786d"))))
 '(fringe ((t (:background "#f6f3e8"))))
 '(header-line ((t (:foreground "#303030" :background "#e7f6da"))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:foreground "#101010" :background "#e5dbcf"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:box (:line-width (2 . 2) :color "#447674" :style nil)))))
 '(mode-line-inactive ((t (:foreground "#808080" :background "#f6f3e8"))))
 '(isearch ((t (:foreground "#857b6f" :background "#343434"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((t (:foreground "#384048" :background "#a0a8b0"))))
 '(match ((t (:background "RoyalBlue1"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'tre3k-light)
