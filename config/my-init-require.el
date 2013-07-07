;; my-init-require.el --- init.elからロードするパッケージ関連を読み込むファイル
;; -*- coding:utf-8 -*-

;; auto-install.el
;; http://www.emacswiki.org/emacs/download/auto-install.el
(require-and-when 'auto-install
                  (setq auto-install-directory "~/.emacs.d/site-lisp")
                  ;; 起動時にEmacsWikiのページを補間候補に加える
                  (if (auto-install-use-wget-p)
                      (auto-install-update-emacswiki-package-name t))
                  ;; install-elisp.el互換モードにする
                  (auto-install-compatibility-setup)
                  ;; editff関連バッファを１つのフレームにまとめる
                  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;; ELPA
;; (install-elisp "http://tromey.com/elpa/package-install.el")
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; auto-complete.el
;; http://cx4a.org/software/auto-complete/index.ja.html
(require-and-when 'auto-complete-config
                  (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
                  (add-to-list 'ac-modes 'sql-mode)
                  (add-to-list 'ac-modes 'yaml-mode)
                  (ac-config-default))

;; color-theme.el
;; http://www.nongnu.org/color-theme/
(require-and-when 'color-theme
                  (color-theme-initialize)
                  ;;(color-theme-aalto-light)
                  ;;(color-theme-hober)
                  ;;(color-theme-tty-dark)
                  ;; (color-theme-pok-wob)
                  (color-theme-taylor))

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
;; (require-and-when 'jaspace
;;                   (setq jaspace-alternate-eol-string "\x24\n")
;;                   (set-face-foreground 'jaspace-highlight-tab-face "brown")
;;                   (setq jaspace-highlight-tabs ?^)
;;                   (add-to-list 'jaspace-modes 'ruby-mode)
;;                   (add-hook 'find-file-hook 'jaspace-mode-on))
;; whitespace-mode
(global-whitespace-mode)
(setq whitespace-style
      '(face tabs tab-mark spaces space-mark newline newline-mark trailing))
(setq whitespace-space-regexp "\\(\u3000+\\)")

(dolist (d '((space-mark ?\ ) (tab-mark ?\t)))
  (setq whitespace-display-mappings
        (delete-if
         '(lambda (e) (and (eq (car d) (car e))
                           (eq (cadr d) (cadr e))))
         whitespace-display-mappings)))

(dolist (e '((space-mark ?\u3000 [?□]) (tab-mark ?\t [?^ ?\t])))
  (add-to-list 'whitespace-display-mappings e))

(set-face-foreground 'whitespace-newline "darkcyan")
(custom-set-faces
 '(whitespace-space ((t
                      (:foreground "pink4"))))
 ;; '(whitespace-hspace ((t
 ;;                      (:foreground "pink4" :background "white"))))
 '(whitespace-tab ((t
                    (:strike-through t :foreground "brown")))))

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
                  (define-key global-map (kbd "C-,") 'recentf-open-files))

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
                  (define-key global-map (kbd "C-<") 'goto-last-change)
                  (define-key global-map (kbd "C->") 'goto-last-change-reverse))

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
;; (install-elisp "http://www.rubyist.net/~rubikitch/archive/fold-dwim.el")
;; (install-elisp "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")
;; (install-elisp-from-emacswiki "hideshowvis.el")
(require-and-when 'hideshow
                  (require 'fold-dwim)
                  ;(require 'hideshowvis)
                  (setq hs-allow-nesting t)
                  (defun toggle-selective-display (col)
                    ""
                    (interactive
                     (let (col)
                       (save-excursion
                         (beginning-of-line)
                         (skip-chars-forward " \t")
                         (setq col (current-column))
                         (list (read-number "Toggle Indent: " col)))))
                    (if (zerop col)
                        (hs-hide-level nil)
                      (hs-hide-level col)))
                  (define-key global-map (kbd "C-;") 'fold-dwim-toggle-all)
                  ;; (define-key global-map (kbd "C-.") 'fold-dwim-toggle)
                  (define-key global-map (kbd "C-:") 'hs-toggle-hiding)
                  (define-key global-map (kbd "C-]") 'hs-hide-level)
                  ;; (define-key global-map (kbd "<f7>") 'fold-dwim-toggle)
                  ;; (define-key global-map (kbd "<C-f7>") 'fold-dwim-hide-all)
                  ;; (define-key global-map (kbd "<C-S-f7>") 'fold-dwim-show-all)
                  ;; (define-key global-map (kbd "<S-f7>") 'hs-hide-level)
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
(require-and-when 'jump-dls
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
(require 'anything-startup)
;; idoと共存させる
(anything-read-string-mode 0)

;; http://ruby-debug.rubyforge.org/svn/ruby-debug-0.10.5/emacs/
(require 'rdebug)

;; (install-elisp-from-emacswiki "htmlize.el")

;; Ruby on Rails IDE
(require 'rinari)
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-hook 'rhtml-mode-hook '(lambda () (rinari-launch)))
(setq rinari-tags-file-name "TAGS")

;; (install-elisp "http://tweedle-dee.org/svn/emacs.d/site-lisp/yaml-mode.el")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\(\\.yml$\\|\\.yaml$\\)" . yaml-mode))

;; git clone git://github.com/emacsmirror/multiple-cursors.git
(require 'multiple-cursors)
(define-key my-Q-key-map (kbd "C-c") 'mc/edit-lines)
(define-key my-Q-key-map (kbd "C-a") 'mc/mark-all-like-this)
(define-key my-Q-key-map (kbd "C-p") 'mc/mark-previous-like-this)
(define-key my-Q-key-map (kbd "C-n") 'mc/mark-next-like-this)
(define-key my-Q-key-map (kbd "RET") 'mc/mark-more-like-this-extended)

;; (shell-command "git clone git://github.com/magnars/expand-region.el.git")
(require-and-when 'expand-region
                  (define-key global-map (kbd "C-@") 'er/expand-region)
                  (define-key global-map (kbd "C-`") 'er/contract-region))

;; (auto-install-from-emacswiki "smartrep.el")
(require-and-when 'smartrep
                  (smartrep-define-key global-map "C-q"
                    '(("C-n" . 'mc/mark-next-like-this)
                      ("C-p" . 'mc/mark-previous-like-this))))

(require 'rsense)
(setq rsense-home "C:\\rsense-0.3")
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
