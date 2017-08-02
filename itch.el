;;; itch.el --- Scratch buffer tools.
;; Copyright 2017 by Dave Pearson <davep@davep.org>

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.2
;; Keywords: convenience
;; URL: https://github.com/davep/itch.el

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

(provide 'itch)

;;; itch.el ends here
