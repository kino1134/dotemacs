;; my-init-require.el --- init.elからロードするパッケージ関連を読み込むファイル

;; -*- coding:utf-8 -*-

;; auto-install.el
;; http://www.emacswiki.org/emacs/download/auto-install.el
(require-and-when 'auto-install
                  ;; (setq url-proxy-services '(("http" . "localhost:8080"))) 
                  (setq auto-install-directory "~/.emacs.d/site-lisp")
                  ;; 起動時にEmacsWikiのページを補間候補に加える
                  (auto-install-update-emacswiki-package-name t)
                  ;; install-elisp.el互換モードにする
                  (auto-install-compatibility-setup)
                  ;; editff関連バッファを１つのフレームにまとめる
                  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;; auto-complete.el
;; http://cx4a.org/software/auto-complete/index.ja.html
(require-and-when 'auto-complete-config
                  (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
                  (ac-config-default))

;; color-theme.el
;; http://www.nongnu.org/color-theme/
(require-and-when 'color-theme
                  (color-theme-initialize)
                  ;;(color-theme-aalto-light)
                  ;;(color-theme-hober)
                  ;;(color-theme-tty-dark)
                  (color-theme-pok-wob))

;; open-junk-file.el
;; (install-elisp-from-emacswiki open-junk-file.el)
(require-and-when 'open-junk-file
                  (setq open-junk-file-format "~/junk/%Y%m%d_%H%M%S."))
 
;; maxframe.el
;; http://files.emacsblog.org/ryan/elisp/maxframe.el
(require-and-when 'maxframe
                  (add-hook 'window-setup-hook 'maximize-frame t))

;; redo+.el
;; (install-elisp-from-emacswiki redo+.el)
(require-and-when 'redo+
                  (global-set-key (kbd "C-\\") 'redo)
                  (setq undo-no-redo t)
                  (setq undo-limit 600000)
                  (setq undo-strong-limit 900000))

;; jaspace.el	　
;; http://homepage3.nifty.com/satomii/software/elisp.ja.html
;; (install-elisp "http://homepage3.nifty.com/satomii/software/jaspace.el")
(require-and-when 'jaspace
                  (setq jaspace-alternate-eol-string "\x24\n")
                  (set-face-foreground 'jaspace-highlight-tab-face "brown")
                  (setq jaspace-highlight-tabs ?^)
                  (add-to-list 'jaspace-modes 'ruby-mode)
                  (add-hook 'find-file-hook 'jaspace-mode-on))

;; summarye.el
;; (install-elisp-from-emacswiki "summarye.el")
(require 'summarye)

;; sequential-command.el
;; C-a C-e M-ulc を連続入力で挙動を変更する
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command.el")
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command-config.el")
(require-and-when 'sequential-command
                  (require 'sequential-command-config)
                  (sequential-command-setup-keys)
                  (define-sequential-command seq-home
                    back-to-indentation beginning-of-line beginning-of-buffer seq-return)
                  (global-set-key "\C-a" 'seq-home))

;; ファイル名がかぶった時、バッファ名を分かりやすくする。
(require-and-when 'uniquify
                  ;; filename<dir>形式のバッファ名にする
                  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
                  ;; *で囲まれたバッファ名は対象がいにする
                  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;; ElScreen
;; ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/
;; http://www.morishima.net/~naoto/elscreen-ja/
;; APELが必要なため、インストールを行なっている
;; http://cvs.m17n.org/elisp/APEL/
;; インストールバッチを利用せず、直接コピーを行っている
;; (require-and-when 'elscreen
;; C-@		set-mark-command
;;                   (elscreen-set-prefix-key "\C-@")
;;                   (require 'elscreen-server))
;; (install-elisp "http://emhacks.cvs.sourceforge.net/viewvc/emhacks/emhacks/tabbar.el?revision=1.69&content-type=text%2Fplain")
;; (require-and-when 'tabbar
;;                   (tabbar-mode))

;; recentff-ext.el
;; (install-elisp-from-emacswiki "recentf-ext.el")
(require-and-when 'recentf-ext
                  (setq recentf-max-saved-items 500)
                  ;(setq recentf-excude '("/TAGS$" "/var/tmp/")
                  (define-key global-map (kbd "C-;") 'recentf-open-files))

;; bm.el
;; (install-elisp "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")
(require-and-when 'bm
                  (setq-default bm-buffer-persistence nil)
                  (setq bm-restore-repository-on-load t)
                  (add-hook 'find-file-hook 'bm-buffer-restore)
                  (add-hook 'kill-buffer-hook 'bm-buffer-restore)
                  (add-hook 'after-save-hook 'bm-buffer-restore)
                  (add-hook 'after-revert-hook 'bm-buffer-restore)
                  (add-hook 'vc-before-checkin-hook 'bm-buffer-restore)
                  (define-key global-map (kbd "M-SPC") 'bm-toggle)
                  (define-key global-map (kbd "M-[") 'bm-previous)
                  (define-key global-map (kbd "M-]") 'bm-next))

;; goto-chg.el
;; (install-elisp-from-emacswiki "goto-chg.el")
(require-and-when 'goto-chg
                  (define-key global-map (kbd "<f8>") 'goto-last-change)
                  (define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse))

;; emacsclientを使用するための設定
(when window-system
  (require-and-when 'server
                    (unless (server-running-p)
                      (server-start))))

;; 前回編集時のカーソル位置を再現
(require-and-when 'saveplace
                  (setq-default save-place t))

;; paredit.el
;; (install-elisp "http://mumble.net/~campbell/emacs/paredit.el")
;; (require-and-when 'paredit
;;                   (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;;                   (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;;                   (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;;                   (add-hook 'ielm-mode-hook 'enable-paredit-mode))

;; eldoc.el
;; (install-elisp-from-emacswiki "eldoc-extension.el")
(require-and-when 'eldoc-extension
                  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
                  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
                  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
                  (setq eldoc-idle-delay 0.2)
                  (setq eldoc-minor-mode-string ""))
;; fold-dwim.el
;; (install-elisp "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")
;; (install-elisp-from-emacswiki "hideshowvis.el")
(require-and-when 'hideshow
                  (require 'fold-dwim)
                  ;(require 'hideshowvis)
                  (setq hs-allow-nesting t)
                  (define-key global-map (kbd "<f7>") 'fold-dwim-toggle)
                  (define-key global-map (kbd "<C-f7>") 'fold-dwim-hide-all)
                  (define-key global-map (kbd "<C-S-f7>") 'fold-dwim-show-all)
                  (define-key global-map (kbd "<S-f7>") 'hs-hide-level)
                  (add-hook 'emacs-lisp-mode-hook '(lambda () (hs-minor-mode t)))
                  (add-hook 'lisp-interaction-mode-hook '(lambda () (hs-minor-mode t)))
                  (add-hook 'lisp-mode-hook '(lambda () (hs-minor-mode t)))
                  (add-hook 'ruby-mode-hook '(lambda () (hs-minor-mode t)))
                  ;(add-hook 'emacs-lisp-mode-hook 'hideshowvis-enable)
                  ;(add-hook 'lisp-interaction-mode-hook 'hideshowvis-enable)
                  ;(add-hook 'lisp-mode-hook 'hideshowvis-enable)
                  ;(add-hook 'ruby-mode-hook 'hideshowvis-enable)
                  ;(define-fringe-bitmap 'hideshowvis-hideable-marker [0 24 24 126 126 24 24 0])
                  )

;; jump.el
;; (install-elisp-from-emacswiki "jump-dls.el")
(require-and-when 'jump
                  (define-key my-Q-key-map (kbd "j") 'jump-symbol-at-point)
                  (define-key my-Q-key-map (kbd "C-j") 'jump-back))

;; smartchr.el
;; (install-elisp "http://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")
(require-and-when 'smartchr
                  (setq my-smartchr-key-map (make-sparse-keymap))
                  (defun my-smartchr-set-key-map ()
                    (local-set-key (kbd "(") (smartchr '("(`!!')" "(")))
                    (local-set-key (kbd "[") (smartchr '("[`!!']" "[")))
                    (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\""))))
                  (add-hook 'emacs-lisp-mode-hook 'my-smartchr-set-key-map)
                  (add-hook 'lisp-interaction-mode-hook 'my-smartchr-set-key-map)
                  (add-hook 'lisp-mode-hook 'my-smartchr-set-key-map)
                  (add-hook 'ielm-mode-hook 'my-smartchr-set-key-map)
                  (add-hook 'scheme-mode-hook 'my-smartchr-set-key-map))

;; anything.el
;; (auto-install-batch "anything")



;; http://ruby-debug.rubyforge.org/svn/ruby-debug-0.10.5/emacs/
(require 'rdebug)
