;; -*- coding:utf-8 -*-
(require 'bm)

(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-restore)
(add-hook 'after-save-hook 'bm-buffer-restore)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-restore)
(define-key global-map (kbd "M-SPC") 'bm-toggle)
(define-key global-map (kbd "M-[") 'bm-previous)
(define-key global-map (kbd "M-]") 'bm-next)
