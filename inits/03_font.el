;; -*- coding:utf-8 -*-

; フォント設定
(when window-system
  (when (featurep 'dos-w32)
    (set-face-attribute 'default nil
                        :family "consolas"
                        :height 120)
    (set-fontset-font nil 'japanese-jisx0208
                      (font-spec :family "MeiryoKe_Gothic"))
    (set-fontset-font nil 'katakana-jisx0201
                      (font-spec :family "MeiryoKe_Gothic")))
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil
                        :family "ricty"
                        :height 160)
    (set-fontset-font nil 'japanese-jisx0208
                      (font-spec :family "ricty"))
    (set-fontset-font nil 'katakana-jisx0201
                      (font-spec :family "ricty"))))
;; フォントの大きさを変更する
;; (setq face-font-rescale-alist
;;       '((".*consolas*." . 1.0)
;;         (".*MeiryoKe_Gothic*." . 1.2)))
