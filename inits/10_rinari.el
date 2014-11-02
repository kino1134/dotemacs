;; -*- coding:utf-8 -*-
(require 'rinari)
(require 'rhtml-mode)

(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-hook 'rhtml-mode-hook '(lambda () (rinari-launch)))
(setq rinari-tags-file-name "TAGS")
