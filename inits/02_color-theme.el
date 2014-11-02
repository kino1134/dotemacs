;; -*- coding:utf-8 -*-

;; 24以前のカラーテーマをダウンロードする
;; (shell-command "git clone https://github.com/emacs-jp/replace-colorthemes.git ~/.emacs.d/color-themes")
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/color-themes"))

;; (load-theme 'taylor t t)
;; (enable-theme 'taylor)
(load-theme 'darkburn t)

;; カーソルの形、色を変更する
(add-to-list 'default-frame-alist '(cursor-type . bar))
(add-to-list 'default-frame-alist '(cursor-color . "yellow"))

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

;; モードラインの色を変更する
;; (set-face-background 'mode-line "YellowGreen")
;; コメントの色を緑にする
;; (set-face-foreground 'font-lock-comment-face "LawnGreen")
;; 背景色を少し薄くする
;; (set-face-background 'default "gray15")
