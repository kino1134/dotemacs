;; -*- coding:utf-8 -*-

;; C-qをマイキーバインドにする
(defvar my-Q-key-map (make-sparse-keymap) "My original keymap binded to C-q.")
(define-key global-map (kbd "C-q") my-Q-key-map)

;; 日付を挿入する関数
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d")))
(defun my-insert-time ()
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

;; 特殊文字の挿入
(define-key my-Q-key-map (kbd "C-q") 'quoted-insert)

;; 日付、時間の挿入
(define-key my-Q-key-map (kbd "C-;") 'my-insert-date)
(define-key my-Q-key-map (kbd "C-:") 'my-insert-time)

;; 補完モードの実行
(define-key my-Q-key-map (kbd "C-SPC") 'auto-complete)

;; 行番号ジャンプのキーバインドを追加
(define-key my-Q-key-map (kbd "C-g") 'goto-line)
;; 文字の入れ替え C-tから移す
(define-key my-Q-key-map (kbd "C-t") 'transpose-chars)

;; スクリプト実行を行う処理
(define-key my-Q-key-map (kbd "C-e") 'executable-interpret)
