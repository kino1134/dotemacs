;; -*- coding:utf-8 -*-

;; テンプレート設定
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert")
(define-auto-insert "\\.rb" "ruby-template.rb")

;; タイトルバーにファイルのフルパスを表示する
(setq frame-title-format (format "%%b (%%f) - Emacs%s" emacs-version))

;; タブ幅を3に、インデントでタブを使用することを抑制する。
(setq-default tab-width 4 indent-tabs-mode nil)

;; 矩形選択を「C-RET」で行えるようにする
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; その他の設定
(set-language-environment "Japanese")   ; 日本語環境の設定
(prefer-coding-system 'utf-8)           ; デフォルト文字コードの設定
(show-paren-mode t)                     ; 対応する括弧をハイライト
(global-linum-mode)                     ; 行番号表示
(tool-bar-mode 0)                       ; ツールバーを非表示にする
(fset 'yes-or-no-p 'y-or-n-p)           ; yes/no を y/n へ簡略化
(setq
 kill-whole-line t                  ; C-k で行全体を削除
 inhibit-startup-message t          ; 起動時の画面を非表示とする
 scroll-preserve-screen-position t  ; スクロール時のカーソル位置を維持
 view-read-only t                   ; read-onlyと同時にview-modeにする
 initial-scratch-message ""         ; scratchの初期メッセージを消去
 visible-bell t                     ; ビープ音を消して画面を点滅させる
 use-dialog-box nil                 ; ダイアログボックス表示を中止
 ns-pop-up-frames nil ; Finderから表示時、別フレームで表示されるのを止める
 ;; default-directory "~/"             ; 初期ディレクトリを設定
 truncate-partial-width-windows 10) ; 折り返されない最低幅を変更する default:50

;; バックアップファイルの保存場所を変更する。
(add-to-list 'backup-directory-alist
             (cons ".*" (expand-file-name "~/.emacs.d/backup")))
;; オートセーブファイルの保存場所を変更する。
(add-to-list 'auto-save-file-name-transforms
             `(".*" ,(expand-file-name "~/.emacs.d/backup") t))
