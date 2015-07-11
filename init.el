;; -*- coding:utf-8 -*-

(require 'cl)

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; ロードパス設定
(add-to-load-path "site-lisp" "config")
;; 使用しているパッケージ一覧
(defvar install-package-list
  '(
    init-loader
    auto-install
    auto-complete
    open-junk-file
    maxframe
    summarye
    sequential-command
    recentf-ext
    bm
    goto-chg
    eldoc-extension
    fold-dwim
    jump-dls
    enh-ruby-mode
    rinari
    rhtml-mode
    yaml-mode
    multiple-cursors
    expand-region
    undo-tree
    foreign-regexp
    flymake
    csharp-mode
    exec-path-from-shell
    wgrep
    ess
    helm
    helm-descbinds
    ;; zenburn-theme
    ;; hc-zenburn-theme
    darkburn-theme
    hlinum
    flycheck
    smooth-scroll
    anzu
    haskell-mode
    google-translate
    emmet-mode
    ;; rdebug
    ;; yatex-mode
    ;; gdev
    ;; goshcomp
    ))

;; プロキシサーバの設定を行う
;; (setq url-proxy-services '(("http" . "localhost:8080")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(let ((not-installed (loop for x in install-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

(require 'init-loader)
(init-loader-load (expand-file-name (concat user-emacs-directory "inits")))

(load "my-init-tex")

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
;;   git config --global user.email test@example.com

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
