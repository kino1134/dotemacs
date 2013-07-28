;; org-mode config export latex -> pdf
(add-hook 'org-mode-hook
          (lambda ()
            (require 'org-latex)
            (add-to-list 'org-export-latex-classes
                         '("jsarticle"
                           "\\documentclass{jsarticle}"
                           ("\\section{%s}" . "\\section*{%s}")
                           ("\\subsection{%s}" . "\\subsection*{%s}")
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                           ;("\\paragraph{%s}" . "\\paragraph*{%s}")
                           ;("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                           ))
            (add-to-list 'org-export-latex-classes
                         '("jarticle"
                           "\\documentclass{jarticle}"
                           ("\\section{%s}" . "\\section*{%s}")
                           ("\\subsection{%s}" . "\\subsection*{%s}")
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                           ;("\\paragraph{%s}" . "\\paragraph*{%s}")
                           ;("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                           ))
            (dolist (elt org-export-latex-default-packages-alist)
              (when (and (listp elt) (string-equal "graphicx" (cadr elt)))
                (setcar elt "dvipdfmx, hiresbb")))
            ;(setq org-export-headline-levels 3)
            (setq org-latex-to-pdf-process
                  '("platex -kanji=utf8 -shell-escape %b" "platex -kanji=utf8 -shell-escape %b" "dvipdfmx -f vl_gothic.map %b"))
            (setcdr (assoc "\\.pdf\\'" org-file-apps) "SumatraPDF %s")
            (setq org-export-latex-image-default-option "scale=1.0")
            (setq org-export-latex-hyperref-format "\\ref{%s}")
            (setq org-export-latex-listings t)
            (setq org-export-latex-listings-options
                  '(("breaklines" "true")
                    ("basicstyle" "\\ttfamily")
                    ("classoffset" "1")
                    ;("keywordstyle" "{\\bfseries \\color[rgb]{0,0,1}}")
                    ;("commentstyle" "{\\ttfamily \\color[cmyk]{1,0.4,1,0}}")
                    ("commentstyle" "{\\ttfamily}")
                    ;("stringstyle" "{\\ttfamily \\color[cmyk]{0,1,0,0}}")
                    ("frame" "single")
                    ("frameround" "tttt")
                    ;("framesep" "5pt")
                    ("showstringspaces" "false")
                    ("xleftmargin" "10pt")
                    ("xrightmargin" "10pt")
                    ))
            ;(setq org-export-latex-verbatim-wrap '("\\begin{lstlisting}\n". "\\end{lstlisting}"))
            (add-to-list 'org-export-latex-listings-langs '(csharp "[sharp]C"))
            (add-to-list 'org-export-latex-packages-alist '("" "listings, jlisting"))
            (add-to-list 'org-export-latex-packages-alist '("dvipdfmx" "color"))
            (add-to-list 'org-export-latex-packages-alist "\\makeatletter
\\renewcommand{\\thefigure}{%
\\thesection.\\arabic{figure}}
\\@addtoreset{figure}{section}
\\makeatother
")
            (add-to-list 'org-export-latex-packages-alist "\\makeatletter
\\long\\def\\@makecaption#1#2{{\\small
  \\advance\\leftskip .0628\\linewidth
  \\advance\\rightskip .0628\\linewidth
  \\vskip\\abovecaptionskip
  \\sbox\\@tempboxa{#1\\hskip1zw\\relax #2}%
  \\ifdim \\wd\\@tempboxa <\\hsize \\centering \\fi
  %#1\\hskip1zw\\relax #2\\par listingsでtitleのみ表示しようとすると、1zwという文字が出てくる
  #1\\relax #2\\par
  \\vskip\\belowcaptionskip}}
\\makeatletter
")
            ))
;; (defun insert-lstinput (file-name options)
;;   (insert (format "\\lstinputlisting[%s]{%s}" options options)))
;; (org-add-link-type
;;  "src" nil
;;  (lambda (path desc format)
;;    (cond
;;     ((eq format 'latex)
;;      (format "\\lstinputlisting[%s]{%s}" desc path)))))

;;; yatex-mode---------------------------------------------------------------------------
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code nil)
(setq dvi2-command "\"C:/Program Files/Adobe/Reader 10.0/Reader/AcroRd32.exe\"")
(setq tex-command "platex --kanji=utf-8")
(add-to-list 'ac-modes 'yatex-mode)

