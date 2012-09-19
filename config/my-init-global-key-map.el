;;; my-init-global-key-map.el --- グローバルキーマップをカスタマイズするファイル

;; -*- coding:utf-8 -*-

;;; ---メモ---
;; C-q C-i でタブ文字検索可能 C-q C-j, m などで改行文字も検索可能となる
;; f1 b でキーバインド調査を行える
;; 1ストロークのキーバインドの再設定ができそうなものをいかに列挙
;; C-[ = ESC となるため、使用出来ない
;; ^,. <apps>

;; C-k		kill-line
;; 他に、kill-whole-lineもある。こちらは、改行も含めて切り取るのではないか？

;; C-x C-q で読み取り専用モードに移行


;; フレーム移動のキーバインドを変更
(define-key global-map (kbd "C-t") 'other-window)
;; (define-key global-map (kbd "C-.") 'next-multiframe-window)
(define-key global-map (kbd "C-<tab>") 'next-multiframe-window)
(define-key global-map (kbd "C-S-<tab>") 'previous-multiframe-window)
;; 各メジャーモードへ移行するためのキーバインド
(define-key global-map (kbd "<f5>-r") 'ruby-mode)
(define-key global-map (kbd "<f5>-s") 'scheme-mode)
;; バックスペースをC-hへ変更
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-h") 'backward-kill-sexp)
;; 元のM-hを移す
(define-key global-map (kbd "M-p") 'mark-paragraph)
;; 前ページの表示をC-zへ変更
(define-key global-map (kbd "C-z") 'scroll-down)
;; 折り返しトグルコマンド
(define-key global-map (kbd "C-C l") 'toggle-truncate-lines)

;; インクリメンタルサーチ時のキーバインド変更
(define-key isearch-mode-map (kbd "<f1>") isearch-help-map)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; バッファ一覧を少し変更
;; 具体的に何が変わるかは、これから検証
(define-key global-map (kbd "C-x C-b") 'buffer-menu)

;; 行頭クリック時の動きを追加
(define-key global-map (kbd "<left-margin> <mouse-1>") 'mouse-set-point)
(define-key global-map (kbd "<left-margin> <down-mouse-1>") 'mouse-drag-region)

;; 日付を挿入する関数
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d")))
(defun my-insert-time ()
  (interactive)
  (insert (format-time-string "%H:%M:%S")))

;; C-qをマイキーバインドにする
(setq my-Q-key-map (make-sparse-keymap))
(define-key global-map (kbd "C-q") my-Q-key-map)
;; 特殊文字の挿入
(define-key my-Q-key-map (kbd "C-q") 'quoted-insert)

(define-key my-Q-key-map (kbd "C-d") 'my-insert-date)
(define-key my-Q-key-map (kbd "C-t") 'my-insert-time)
(define-key my-Q-key-map (kbd "C-SPC") 'auto-complete)
;; 行番号ジャンプのキーバインドを追加
(define-key my-Q-key-map (kbd "C-g") 'goto-line)
;; 文字の入れ替え C-tから移す
(define-key my-Q-key-map (kbd "C-t") 'transpose-chars)


(defun shell-command-on-buffer (command &optional replace error-buffer display-error-buffer)
  (interactive
   (list
    (read-shell-command
     "Shell command: " nil nil
     (let ((filename
            (cond
             (buffer-file-name)
             ((eq major-mode 'dired-mode)
              (dired-get-filename nil t)))))
       (and filename (file-relative-name filename))))
    current-prefix-arg
    shell-command-default-error-buffer))
  (shell-command-on-region (point-min) (point-max) command
                           nil replace error-buffer display-error-buffer)
  (pop-to-buffer "*Shell Command Output*"))
(define-key my-Q-key-map (kbd "C-e") 'shell-command-on-buffer)
(define-key my-Q-key-map (kbd "C-e") (lambda () (interactive) (shell-command-on-buffer "ruby")))