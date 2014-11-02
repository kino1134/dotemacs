;; -*- coding:utf-8 -*-

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
