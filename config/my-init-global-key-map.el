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
(define-key global-map (kbd "C-<tab>") 'next-multiframe-window)
(define-key global-map (kbd "C-S-<tab>") 'previous-multiframe-window)
;; 各メジャーモードへ移行するためのキーバインド
(define-key global-map (kbd "<f5>-r") 'ruby-mode)
(define-key global-map (kbd "<f5>-s") 'scheme-mode)
;; バックスペースをC-hへ変更
(define-key global-map (kbd "C-h") 'delete-backward-char)
;; 前ページの表示をC-zへ変更
(define-key global-map (kbd "C-z") 'scroll-down)
;; 行番号ジャンプのキーバインドを追加
(define-key global-map (kbd "C-^") 'goto-line)
;; 折り返しトグルコマンド
(define-key global-map (kbd "C-C l") 'toggle-truncate-lines)

;; インクリメンタルサーチ時のキーバインド変更
(define-key isearch-mode-map (kbd "<f1>") isearch-help-map)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; バッファ一覧を少し変更
;; 具体的に何が変わるかは、これから検証
(define-key global-map (kbd "C-x C-b") 'bs-show)
