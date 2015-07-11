;; -*- coding:utf-8 -*-
(require 'hideshow)
(require 'fold-dwim)

(setq hs-allow-nesting t)
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
(add-hook 'enh-ruby-mode-hook '(lambda () (hs-minor-mode t)))
;; (add-hook 'emacs-lisp-mode-hook 'hideshowvis-enable)
;; (add-hook 'lisp-interaction-mode-hook 'hideshowvis-enable)
;; (add-hook 'lisp-mode-hook 'hideshowvis-enable)
;; (add-hook 'ruby-mode-hook 'hideshowvis-enable)
;; (define-fringe-bitmap 'hideshowvis-hideable-marker [0 24 24 126 126 24 24 0])

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