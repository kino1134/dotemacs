;; -*- coding:utf-8 -*-
(require 'exec-path-from-shell)

;; 環境変数設定(rbenvのため)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
