;; -*- coding:utf-8 -*-
(require 'recentf-ext)

(setq recentf-max-saved-items 500)
;; (setq recentf-excude '("/TAGS$" "/var/tmp/"))
(define-key global-map (kbd "C-,") 'recentf-open-files)
