;;; itch.el --- Scratch buffer tools  -*- lexical-binding: t; -*-
;; Copyright 2017 by Dave Pearson <davep@davep.org>

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.2
;; Keywords: convenience
;; URL: https://github.com/davep/itch.el
;; Package-Requires: ((emacs "24.4"))

;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
;; Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; itch.el provides a tool for quickly and easily getting back to your
;; *scratch* buffer (with optional erase).

;;; Code:

;;;###autoload
(defun itch-scratch-buffer (&optional erase)
  "Quickly switch to the *scratch* buffer.

If ERASE is non-nil reset the content of the buffer."
  (interactive "P")
  (switch-to-buffer "*scratch*")
  (when erase
    (erase-buffer))
  (when (string= (buffer-string) "")
    (insert initial-scratch-message))
  (lisp-interaction-mode))

(defun itch-markdown-scratch-buffer (&optional erase)
  "Quickly switch to the *scratch: Markdown* buffer.

If ERASE is non-nil reset the content of the buffer."
  (interactive "P")
  (switch-to-buffer "*scratch: Markdown*")
  (when erase
    (erase-buffer))
  (when (string-empty-p (buffer-string))
    (insert initial-scratch-message)
    (save-excursion
      (goto-char (point-min))
      (delete-region (point) (+ (point) 3))
      (insert "[//]: # (")
      (end-of-line)
      (insert ")")))
  (markdown-mode))

(provide 'itch)

;;; itch.el ends here
