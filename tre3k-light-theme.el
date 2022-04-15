;; Copyright (c) 2022 Kirill Pshenichnyi
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

      ;; Syntax color scheme
      (font_lock_comment_color "#797b82")
      (font_lock_builtin_color "#476f96")
      (font_lock_constan_color "#1e8d73")
      (font_lock_variable_name_color "#8d453e")
      (font_lock_string_color "#97362c")
      (font_lock_keyword_color "#2b2d9e")
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
				       ,font_lock_variable_name_color
				       ))))

   `(font-lock-doc-face ((t (
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


   ;; Interface
   )
  )



(provide-theme 'tre3k-light)
