;; -*- coding:utf-8 -*-

(require 'enh-ruby-mode)

(autoload 'enh-ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; inf-ruby
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'enh-ruby-mode-hook '(lambda () (inf-ruby-keys)))
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))

;; ruby-electric
;; (install-elisp "https://raw.githubusercontent.com/qoobaa/ruby-electric/master/ruby-electric.el")
(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(add-hook 'enh-ruby-mode-hook '(lambda () (setq tab-width 2)))

;; ruby-style
;; (require 'ruby-style)
;; (add-hook 'c-mode-hook 'ruby-style-c-mode)
;; (add-hook 'c++-mode-hook 'ruby-style-c-mode)

;; rubydb
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; マジックコメントの表記を修正する
(add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
(add-to-list 'enh-ruby-encoding-map '(japanese-cp932 . cp932))

;; Ruby用flymakeの設定
;; (require 'flymake)
;; (defun flymake-ruby-init ()
;;   (list "ruby" (list "-wc" (flymake-init-create-temp-buffer-copy
;;                             'flymake-create-temp-inplace))))
;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.rb\\'" flymake-ruby-init))
;; (add-to-list 'flymake-err-line-patterns
;;              '("\\(.*\\):\\([0-9]+\\): \\(.*\\)" 1 2 nil 3))
;; (add-hook 'enh-ruby-mode-hook '(lambda () (when buffer-file-name (flymake-mode t))))

;; Ruby用hideshowの設定
(let ((ruby-mode-hs-info
       '(enh-ruby-mode
         "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
         "end"
         "#"
         ruby-move-to-block
         nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))

;; rdefs
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map (kbd "C-q r")
              (lambda ()
                (interactive)
                (let ((command (format "rdefs -e %s" (buffer-file-name)))
                      (buf-name (format "rdefs(%s)" (buffer-name))))
                  (compilation-start command t (lambda (_) buf-name))
                  (switch-to-buffer-other-window buf-name)
                  (set (make-local-variable 'font-lock-keywords) (append (compilation-mode-font-lock-keywords) ruby-font-lock-keywords))
                )
                ))))

