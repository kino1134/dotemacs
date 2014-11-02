;; -*- coding:utf-8 -*-
(require 'multiple-cursors)

(setq mc/list-file "~/.emacs.d/config/.mc-lists.el")

(define-key my-Q-key-map (kbd "C-c") 'mc/edit-lines)
(define-key my-Q-key-map (kbd "C-a") 'mc/mark-all-like-this)
(define-key my-Q-key-map (kbd "C-p") 'mc/mark-previous-like-this)
(define-key my-Q-key-map (kbd "C-n") 'mc/mark-next-like-this)
(define-key my-Q-key-map (kbd "RET") 'mc/mark-more-like-this-extended)
(define-key mc/keymap (kbd "C-z") 'mc/cycle-backward)
