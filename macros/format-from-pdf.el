(defun replace-pdf-symbols ()
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))

    (goto-char (point-min))
    (while (search-forward "≈" nil t) (replace-match "\\approx" nil t))
    (goto-char (point-min))
    (while (search-forward "±" nil t) (replace-match "\\pm" nil t))
    (goto-char (point-min))
    (while (search-forward "−" nil t) (replace-match "-" nil t))
    (goto-char (point-min))
    (while (search-forward "θ" nil t) (replace-match "$\\theta$" nil t))
    (goto-char (point-min))
    (while (search-forward "δ" nil t) (replace-match "$\\delta$" nil t))
    (goto-char (point-min))
    (while (search-forward "Γ" nil t) (replace-match "$\\Gamma$" nil t))
    )
  )


(defun format-from-pdf ()
  "remove newlines and newlines from point"
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t)
      (replace-match "" nil t)
      )
    (goto-char (point-min))
    (while (search-forward ". " nil t)
      (replace-match ".\n" nil t)
      )
    )
  )

(provide 'replace-pdf-symbols)
(provide 'format-from-pdf)
