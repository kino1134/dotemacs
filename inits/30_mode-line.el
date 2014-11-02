;; -*- coding:utf-8 -*-

;; 列番号を表示
(column-number-mode)

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 時計を表示
(setq display-time-string-forms '((format-time-string "%m/%d(%a) %H:%M")))
(display-time-mode t)
