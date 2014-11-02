;; -*- coding:utf-8 -*-
(require 'flymake)

;; flymakeの見た目を変更する
;; (set-face-background 'flymake-errline "Firebrick4")
;; (set-face-background 'flymake-warnline "DarkBlue")
(set-face-background 'flymake-errline "red")
(set-face-background 'flymake-warnline "blue")

;; http://d.hatena.ne.jp/sugyan/20100705/1278306885
(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)
