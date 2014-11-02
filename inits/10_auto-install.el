;; -*- coding:utf-8 -*-
(require 'auto-install)

(setq auto-install-directory "~/.emacs.d/site-lisp")
;; 起動時にEmacsWikiのページを補間候補に加える
(if (auto-install-use-wget-p)
    (auto-install-update-emacswiki-package-name t))
;; install-elisp.el互換モードにする
;; ここまでにフォント設定しておかないと、落ちる
(auto-install-compatibility-setup)
;; editff関連バッファを１つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
