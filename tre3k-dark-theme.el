;; Copyright (c) 2023 Kirill Pshenichnyi
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(deftheme tre3k-dark "My generic dark theme")

(let (;; Base font
      (font_family "Victor Mono")
      (font_height 128)

      (font_lock_constant_family "Victor Mono SemiBold")

      ;; Colors:
      (background_color "#343434")
      (foreground_color "#e6e3d8")

      (hl_background_color "#4d4324")
      (hl_foreground_color "#e6e3d8")

      ;; Cursor
      (cursor_color "#e9c9de")
      ;; Selection
      (region_color "#414141")
      ;; Escape glyph
      (escape_glyph_color "#ddaa6f")

      ;;Tab bar colors
      (tab-bar-background "#444444")
      (tab-bar-tab-background "#343434")

      ;; Mode line
      (mode_line_foreground "#e5e3d9")
      (mode_line_background "#444444")
      (mode_line_inactive_foreground "#857b6f")
      (mode_line_inactive_background "#444444")

      ;; Syntax color scheme
      (font_lock_comment_color  "#99968b")
      (font_lock_builtin_color  "#e5786d")
      (font_lock_constan_color  "#e5786d")
      (font_lock_variable_color "#cae682")
      (font_lock_string_color   "#e5786d")
      (font_lock_keyword_color  "#8ac6f2")
      (font_lock_function_color "#cae682")
      (font_lock_warning_color  "#ccaa8f")
      (font_lock_type_color     "#04a040")

      )


  (custom-theme-set-faces
   'tre3k-dark

   ;; Basic
   `(default ((t (
		  :family ,font_family
		  :height, font_height
		  :background ,background_color
		  :foreground ,foreground_color
		  ))))
   `(highlight ((t (
		    :background ,hl_background_color
		  ;;:foreground ,hl_foreground_color
		    ))))

   `(cursor ((t (
		 :background ,cursor_color
		 ))))

   `(region ((t (
		 :background ,region_color
		 ))))
   `(escape-glyph ((t (
		       :weight bold
		       :foreground ,escape_glyph_color
		       ))))



   ;; Set syntax color scheme
   `(font-lock-builtin-face ((t (
				 :foreground ,font_lock_builtin_color
				 ))))

   `(font-lock-comment-face ((t (
				 :family ,font_family
				 :slant italic
				 :foreground ,font_lock_comment_color
				 ))))

   `(font-lock-comment-delimiter-face ((t (
					   :inherit (font-lock-comment-face)
					   ;; :family ,font_family
					   ;; :weight bold
					   ;; :foreground
					   ;; ,font_lock_comment_color
					   ))))

   `(font-lock-constant-face ((t (
				  :family ,font_lock_constant_family
				  :foreground ,font_lock_constan_color
				  ))))

   `(font-lock-variable-name-face ((t (
				       :foreground
				       ,font_lock_variable_color
				       ))))

   `(font-lock-doc-face ((t (
			     :foreground ,font_lock_comment_color
			     ))))
   `(font-lock-doc-markup-face (( t (
				     :weight bold
				     :foreground ,font_lock_comment_color
				     ))))
   `(font-lock-string-face ((t (
				:slant italic
				:foreground ,font_lock_string_color
				))))
   `(font-lock-keyword-face ((t (
				 :weight bold
				 :foreground ,font_lock_keyword_color
				 ))))
   `(font-lock-function-name-face ((t (
				       :foreground ,font_lock_function_color
				       ))))
   `(font-lock-negation-char-face ((t nil)))
   `(font-lock-preprocessor-face ((t (
				      :inherit (font-lock-builtin-face)
				      ))))
   `(font-lock-regexp-grouping-backslash ((t (
					      :inherit (bold)
					      ))))
   `(font-lock-regexp-grouping-construct ((t (
					      :inherit (bold)
					      ))))
   `(font-lock-warning-face ((t (
				 :foreground
				 ))))
   `(font-lock-type-face ((t (
			      :weight bold
			      :foreground ,font_lock_type_color
			      ))))

   ;; Interface
   `(header-line ((t (:foreground "#e7f6da" :background "#303030"))))
   ;; Tab bar
   `(tab-bar ((t (
		  :background ,tab-bar-background
		  :foreground "#f6f3e8"
		  :family "Victor Mono SemiBold"
		  ))))
   `(tab-bar-tab ((t (
		      :inherit tab-bar
		      ;;:box (:line-width 3 :color ,tab-bar-tab-background)
		      :background ,tab-bar-tab-background
		      ))))
   `(tab-bar-tab-inactive ((t (
			       :foreground ,foreground_color
			       :background ,tab-bar-background
			       ))))

   `(fringe ((t (:background ,background_color))))
   `(calendar-today  ((t (:background "#24613e"))))

   ;; Minibuffer
   `(minibuffer-prompt ((t (
			    :weight bold
			    :foreground ,foreground_color
			    ))))
   ;; Mode line
   `(mode-line ((t (
		    :foreground ,mode_line_foreground
		    :background ,mode_line_background))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-highlight ((t (
			      :box (
				    :line-width 2
				    :color ,tab-bar-tab-background
				    :style nil
				    )
			      ))))
   `(mode-line-inactive ((t (
			     :foreground ,mode_line_inactive_foreground
			     :background ,mode_line_inactive_background
			     ))))
   )
  )

(provide-theme 'tre3k-dark)
