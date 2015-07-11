;; -*- coding:utf-8 -*-
(require 'auto-complete)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(require 'auto-complete-config)
(add-to-list 'ac-modes 'sql-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'enh-ruby-mode)
(ac-config-default)
