;; -*- coding:utf-8 -*-

;; Windowsの場合
(when (featurep 'dos-w32)
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

;; Macの場合
(when (eq system-type 'darwin)
  ;; ファイル名の設定
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)
  ;; IMEの設定
  (mac-input-method-mode t)
  ;(setq default-input-method "MacOSX")
  ;(mac-set-input-method-parameter "com.google.5inputmethod.Japanese.base" `title "あ")
  (mac-set-input-method-parameter
   "com.google.inputmethod.Japanese.base" `cursor-color "red")
  (mac-set-input-method-parameter
   "com.google.inputmethod.Japanese.Roman" `cursor-color "yellow")
  (mac-input-method-update
   "com.google.inputmethod.Japanese.base")
  (mac-translate-from-yen-to-backslash))
