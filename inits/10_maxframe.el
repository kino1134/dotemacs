;; -*- coding:utf-8 -*-

(if (eq system-type 'darwin)
    (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (require 'maxframe)
  (add-hook 'window-setup-hook 'maximize-frame t))
