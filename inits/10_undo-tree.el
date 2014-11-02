;; -*- coding:utf-8 -*-
(require 'undo-tree)

(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-_") 'undo-tree-redo)
