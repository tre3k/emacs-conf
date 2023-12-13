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

(deftheme tre3k-light "My generic light theme")

(let (;; Base font
      (font_family "Victor Mono")
      (font_height 128)

      (font_lock_constant_family "Victor Mono SemiBold")

      ;; Colors:
      (background_color "#f9f9f9")
      (foreground_color "#333439")

      ;; Cursor
      (cursor_color "#656565")
      ;; Selection
      (region_color "#dbd6a0")
      ;; Escape glyph
      (escape_glyph_color "#846642")

      ;;Tab bar colors
      (tab-bar-background "#d5d6dd")
      (tab-bar-tab-background "#78937a")

      ;; Mode line
      (mode_line_foreground "#ffffff")
      (mode_line_background "#78937a")
      (mode_line_inactive_foreground "#939191")
      (mode_line_inactive_background "#e6e4e4")

      ;; Syntax color scheme
      (font_lock_comment_color "#797b82")
      (font_lock_builtin_color "#476f96")
      (font_lock_constan_color "#17735d")
      (font_lock_variable_color "#8d453e")
      (font_lock_string_color "#b33636")
      (font_lock_keyword_color "#5142a2")
      (font_lock_function_color "#9b0685")
      (font_lock_warning_color "#d62000")
      (font_lock_type_color "#21586f")
      )


  (custom-theme-set-faces
   'tre3k-light

   ;; Basic
   `(default ((t (
		  :family ,font_family
		  :height, font_height
		  :background ,background_color
		  :foreground ,foreground_color
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
   ;;`(header-line ((t (:foreground "#e7f6da" :background "#303030"))))
   ;; Tab bar
   `(tab-bar ((t (
		  :background ,tab-bar-background
		  :foreground "#ffffff"
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
   `(calendar-today  ((t (:background "#8bfdbc"))))

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

(provide-theme 'tre3k-light)
