;; -*- coding:utf-8 -*-
(require 'expand-region)

(define-key global-map (kbd "C-@") 'er/expand-region)
(define-key global-map (kbd "C-`") 'er/contract-region)
