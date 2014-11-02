;; -*- coding:utf-8 -*-

;; diredバッファで編集を行えるようにする
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
;; diredバッファでもC-t でウィンドウ移動が出来るようにする
(define-key dired-mode-map (kbd "C-t") 'other-window)

;; thumbnail manipulation (image-dired)
(define-key dired-mode-map "bd" 'image-dired-display-thumbs)
(define-key dired-mode-map "bt" 'image-dired-tag-files)
(define-key dired-mode-map "br" 'image-dired-delete-tag)
(define-key dired-mode-map "bj" 'image-dired-jump-thumbnail-buffer)
(define-key dired-mode-map "bi" 'image-dired-dired-display-image)
(define-key dired-mode-map "bx" 'image-dired-dired-display-external)
(define-key dired-mode-map "ba" 'image-dired-display-thumbs-append)
(define-key dired-mode-map "b." 'image-dired-display-thumb)
(define-key dired-mode-map "bc" 'image-dired-dired-comment-files)
(define-key dired-mode-map "bf" 'image-dired-mark-tagged-files)
(define-key dired-mode-map "b\C-t" 'image-dired-dired-toggle-marked-thumbs)
(define-key dired-mode-map "be" 'image-dired-dired-edit-comment-and-tags)
