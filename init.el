;; -*- coding:utf-8 -*-

;; Emacs 23より前のバージョンの場合
;; 設定を追加
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; マクロ内で[,@]は、評価しつつ、リストを1段階展開する
;; requireを少し便利にするマクロ
;; http://d.hatena.ne.jp/khiker/20091120/emacs_require_load_macro
(defmacro require-and-when (feature &rest body)
  `(if (require ,feature nil t)
       (progn ,@body)
     (message "Require error: %s" ,feature)))

(require 'cl)

;; ロードパス設定
(add-to-load-path "site-lisp" "config" "elpa")

(load "my-init-global-key-map")
(load "my-init-require")
(load "my-init-prog-mode")
(load "my-init-looks")
(load "my-init-others")

;;; ---メモ---
;; executable-findで外部コマンドの実行パスを調査する。
;; (executable-find "openssl")

;; C-u digit others で指定したdigit数だけothers文字を挿入できる
;; C-0~9 others でも可能

;; C-x 5 2 (make-frame)
;; C-x 5 0 (delete-frame)

;; emacsで印刷を行うのは難しい

;; 今後、入れたいと思っているパッケージ
;; windows.el anything zlc? wdired slime?
;; (install-elisp "http://github.com/defunkt/gist.el/raw/master/gist.el")

;; Global setup:

;;  Set up git
;;   git config --global user.name "Your Name"
;;   git config --global user.email inoue1134@gmail.com

;; Next steps:

;;   mkdir dotemacs
;;   cd dotemacs
;;   git init
;;   touch README
;;   git add README
;;   git commit -m 'first commit'
;;   git remote add origin git@github.com:kino1134/dotemacs.git
;;   git push -u origin master

;; Existing Git Repo?

;;   cd existing_git_repo
;;   git remote add origin git@github.com:kino1134/dotemacs.git
;;   git push -u origin master

;; Importing a Subversion Repo?

;;   Check out the guide for step by step instructions.

;; When you're done:

;;   Continue
