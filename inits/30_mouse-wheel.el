;; -*- coding:utf-8 -*-

;; マウスホイールの動作設定
(setq
 mouse-wheel-scroll-amount '(3 ((shift) . 10) ((control) . nil)) ; スクロール速度
 mouse-wheel-progressive-speed nil      ; スクロールの加速をしない
 scroll-conservatively 1)               ; スクロール行数を変更
