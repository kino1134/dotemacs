;; -*- coding:utf-8 -*-
(require 'helm)
(require 'helm-config)

(define-key global-map (kbd "M-x")     'helm-M-x)
;; (define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)

(define-key my-Q-key-map (kbd "i")   'helm-imenu)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-z") 'helm-previous-page)
(eval-after-load 'helm-files
    '(progn
       (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
       )
  )

(require 'helm-descbinds)
(helm-descbinds-mode)
