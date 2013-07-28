;;; my-init-prog-mode.el --- メジャーモード関連の設定を行うファイル

;; -*- coding:utf-8 -*-

;; flymakeの見た目を変更する
(require-and-when 'flymake
;                  (set-face-background 'flymake-errline "Firebrick4")
;                  (set-face-background 'flymake-warnline "DarkBlue")
                  (set-face-background 'flymake-errline "red")
                  (set-face-background 'flymake-warnline "blue"))

;;; ruby-mode---------------------------------------------------------------------------
;; 標準のものではruby-electricがうまく動作しなかったため、
;; 以下のsvnから取得を行なっている
;; http://svn.ruby-lang.org/repos/ruby/trunk
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;; inf-ruby
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(add-hook 'ruby-mode-hook '(lambda () (setq tab-width 2)))
;; ruby-style
(require 'ruby-style)
(add-hook 'c-mode-hook 'ruby-style-c-mode)
(add-hook 'c++-mode-hook 'ruby-style-c-mode)
;; rubydb
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (setq ac-sources (append '(ac-source-rcodetools) ac-sources))))
;; rsense
;(setq rsense-home "D:\\rsense-0.3")
;(require 'rsense)

;; マジックコメントの表記を修正する
(add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))

;; Ruby用flymakeの設定
(defun flymake-ruby-init ()
  (list "ruby" (list "-wc" (flymake-init-create-temp-buffer-copy
                            'flymake-create-temp-inplace))))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.rb\\'" flymake-ruby-init))
(add-to-list 'flymake-err-line-patterns
             '("\\(.*\\):\\([0-9]+\\): \\(.*\\)" 1 2 nil 3))
(add-hook 'ruby-mode-hook '(lambda () (when buffer-file-name (flymake-mode t))))

;; Ruby用hideshowの設定
(let ((ruby-mode-hs-info
       '(ruby-mode
         "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
         "end"
         "#"
         ruby-move-to-block
         nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))

;;; scheme-mode---------------------------------------------------------------------------
(modify-coding-system-alist 'process "gosh" '(utf-8 . utf-8))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major Mode For Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name)
  (auto-complete-mode)
  (my-smartchr-set-key-map)
  )

(add-hook 'scheme-mode-hook
          '(lambda ()
             (define-key scheme-mode-map
               "\C-cs" 'scheme-other-window)))
(add-hook 'cmuscheme-load-hook
 '(lambda()
    (defun scheme-args-to-list (string)
      (if (string= string "") nil
        (let ((where (string-match "[ \t]" string)))
          (cond ((null where) (list string))
                ((not (= where 0))
                 (let ((qpos (string-match "^\"\\([^\"]*\\)\"" string)))
                   (if (null qpos)
                       (cons (substring string 0 where)
                             (scheme-args-to-list
                              (substring string (+ 1 where)
                                         (length string))))
                     (cons (substring string
                                      (match-beginning 1)
                                      (match-end 1))
                           (scheme-args-to-list
                            (substring string
                                       (match-end 0)
                                       (length string)))))))
                (t (let ((pos (string-match "[^ \t]" string)))
                     (if (null pos)
                         nil
                       (scheme-args-to-list
                        (substring string pos
                                   (length string))))))))))))

(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'match 'scheme-indent-function 1)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if 'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)
(put 'with-locking-mutex 'scheme-indent-function 1)
(put 'guard 'scheme-indent-function 1)


;; C#-mode------------------------------------------------------------------------------------
;; (install-elisp-from-emacswiki "csharp-mode.el")
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; sql-mode------------------------------------------------------------------------------
(add-hook 'sql-mode-hook '(lambda () (setq tab-width 4 indent-tabs-mode t)))
