;;; my-init-looks.el --- フォントなど、見た目に関してカスタマイズするファイル

;; -*- coding:utf-8 -*-

; フォント設定
(set-face-attribute 'default nil
                    :family "consolas"
                    :height 120)
(set-fontset-font nil 'japanese-jisx0208
                  (font-spec :family "MeiryoKe_Gothic"))
;; フォントの大きさを変更する
;; (setq face-font-rescale-alist
;;       '((".*consolas*." . 1.0)
;;         (".*MeiryoKe_Gothic*." . 1.2)))

;; 選択行をハイライトする設定
;; 設定できる内容は、custom-face-attributes にある
;; f1 v ↑ _-
(global-hl-line-mode t)
(defface hlline-face
  '((((class color)
      (background dark))
     ;; (:background "dark state gray"))
     (:background "gray20"))
;;                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "azure2"))
;;     (:background "white"))
;;                  :underline "blue"))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)

;; 半透明にする。
(when window-system
  (add-to-list 'default-frame-alist '(alpha . 80)))

;; 行間を指定
(setq-default line-spcing 0.1)

;; カーソルの形を変更する
(add-to-list 'default-frame-alist '(cursor-type . bar))
