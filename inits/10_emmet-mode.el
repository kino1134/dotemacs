;; -*- coding:utf-8 -*-
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil))
