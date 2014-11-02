;; -*- coding:utf-8 -*-
(require 'goto-chg)

(define-key global-map (kbd "C-<") 'goto-last-change)
(define-key global-map (kbd "C->") 'goto-last-change-reverse)
