;;; my-init-others.el --- 未分類のカスタマイズ内容を記載したファイル

;; -*- coding:utf-8 -*-

;; テンプレート設定
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert")
(define-auto-insert "\\.rb" "ruby-template.rb")

;; 日本語環境の設定
(set-language-environment "Japanese")

;; デフォルト文字コードの設定
(prefer-coding-system 'utf-8)

;; Windowsの場合
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932)
  (setq w32-enable-synthesized-fonts t)
  (setq default-process-coding-system '(utf-8 . cp932))

  ;; 標準IMEの設定
  (setq default-input-method "W32-IME")

  ;; IME状態のモードライン表示
  (setq-default w32-ime-mode-line-state-indicator "[Aa]")
  (setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

  ;; isearch した時にミニバッファに日本語表示
  (defun w32-isearch-update ()
    (interactive)
    (isearch-update))
  (define-key isearch-mode-map [compend] 'w32-isearch-update)
  (define-key isearch-mode-map [kanji] 'isearch-toggle-input-method)

  (add-hook 'isearch-mode-hook
            (lambda () (setq w32-ime-composition-window (minibuffer-window))))
  (add-hook 'isearch-mode-end-hook
            (lambda () (setq w32-ime-composition-window nil)))

  ;; IME OFF時の初期カーソルカラー
  ;(set-cursor-color "blue")

  ;; IME ON/OFF時のカーソルカラー
  ;; (add-hook 'input-method-activate-hook
  ;;    (lambda() (set-cursor-color "red")))
  ;; (add-hook 'input-method-inactivate-hook
  ;;    (lambda() (set-cursor-color "blue")))
  (add-hook 'w32-ime-on-hook
            (lambda() (set-cursor-color "red")))
  (add-hook 'w32-ime-off-hook
            (lambda() (set-cursor-color "yellow")))

  ;; 4番目のパラメータをisearchのために設定
  (register-input-method "W32-IME" "Japanese" 'w32-ime-state-switch "あ"
                         "W32 System IME")
  ;; IMEの初期化
  (w32-ime-initialize))

;; ido.el
;; バッファ切り替え、ファイル名入力を強化する
(ido-mode 1)       ; コマンドがidoのものに置き換わる
(ido-everywhere 1) ; バッファ名・ファイル名入力すべてがidoに置き換わる

;; バックアップファイルの保存場所を変更する。
(add-to-list 'backup-directory-alist (cons ".*" (expand-file-name "~/.emacs.d/backup")))
;; オートセーブファイルの保存場所を変更する。
(add-to-list 'auto-save-file-name-transforms `(".*" ,(expand-file-name "~/.emacs.d/backup") t))

;; マウスホイールでのスクロール速度の設定
(setq mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)))
;; マウスホイールでのスクロールの加速をするかどうか
(setq mouse-wheel-progressive-speed nil)
;; スクロール行数を変更
(setq scroll-conservatively 1)

;; タブ幅を3に、インデントでタブを使用することを抑制する。
(setq-default tab-width 3 indent-tabs-mode nil)

;; 対応する括弧をハイライト
(show-paren-mode t)

;; 行番号表示
(global-linum-mode)
;; 列番号をモードラインに表示
(column-number-mode)

;;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;; タイトルバーにファイルのフルパスを表示する
;; (multiple-frames "%b" ("" invocation-name "@" system-name))
(setq frame-title-format (format "%%b (%%f) - Emacs%s" emacs-version))

;; ツールバーを非表示にする
(tool-bar-mode 0)

;; 矩形選択を簡単に行えるようにする
;; C-RET で選択を行う
;; その後、RET で選択右に挿入
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; C-k で行全体を削除
(setq kill-whole-line t)

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 初期ディレクトリを設定
;; (setq default-directory "~/")

;; yes/no を y/n へ簡略化
(fset 'yes-or-no-p 'y-or-n-p)

;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; read-onlyと同時にview-modeにする
(setq view-read-only t)

;; 折り返されない最低幅を変更する
;; デフォルトは50
(setq truncate-partial-width-windows 10)

;; scratchの初期メッセージを消去
(setq initial-scratch-message "")

;; ビープ音を消して画面を点滅させる
(setq visible-bell t)

;; diredバッファで編集を行えるようにする
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)

;; 時計を表示
;; (setq display-time-string-forms '((format "%02d/%02s(%s) %s:%s" (string-to-number month) (string-to-number day) dayname 24-hours minutes)))
(setq display-time-string-forms '((format-time-string "%m/%d(%a) %H:%M")))
(display-time-mode t)
