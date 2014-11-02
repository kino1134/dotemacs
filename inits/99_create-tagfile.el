;; -*- coding:utf-8 -*-

(defun create-tagfile (dir)
  (interactive
   (list
    (read-string "Root Directory: " default-directory)))
  (let ((work-dir default-directory))
    (cd dir)
    (async-shell-command "ctags -e -R")
    (cd work-dir)))
