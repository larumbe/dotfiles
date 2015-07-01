;; Everything about running perl on Emacs
;; There seems to be a wealth of available modes
;; 
;; BOOKS
;; Modern Perl http://www.onyxneon.com/books/modern_perl/index.htmlt
;; Impatient Perl http://www.perl.org/books/impatient-perl/
;;
;; SOURCES OF INFORMATION
;; http://www.emacswiki.org/emacs/PerlLanguage
;; http://cpansearch.perl.org/src/YEWENBIN/Emacs-PDE-0.2.16/lisp/doc/QuickStartEn.html
;;
;; AVAILABLE MODES
;; perl-mode
;; cperl: http://www.emacswiki.org/cgi-bin/wiki/CPerlMode
;; 
;; IDEs
;; PDE (seems to be on elpa)
;; Perlysense, sepia
;;
;;;;;;;;;;;;;;;;;;

;; Mode customisations
;;
;; (defalias 'perl-mode 'cperl-mode)

;; DOCUMENTATION
;;;;;;;;;;;;;;;;;;;;;
;; Install documentation files
;; perldoc?
;; PerlDoc package
;; perl-find-library

(setq cperl-invalid-face nil)		; doesnt seem to be working

;; Most cperl mode options turned on
;; (setq cperl-hairy t)

;; ELDOC?
;;

;; Perl inferior proces
;; libs/inf-perl.el
(defun perl-on-buffer ()
  (interactive)
  ;; (shell-command-on-region (point-min) (point-max) "perl" "*Perl Output*")
  (shell-command-on-region (mark) (point) "perl" "*Perl Output*")
  (display-buffer "*Perl Output*"))

(define-key cperl-mode-map (kbd "C-c C-c") 'perl-on-buffer)
(define-key cperl-mode-map (kbd "C-c C-k") '(lambda () (interactive) (kill-buffer "*Perl Output*")))

;; symbols
(define-key cperl-mode-map (kbd "C-c u") '(lambda () (interactive) (insert " = ")))
(define-key cperl-mode-map (kbd "C-c i") '(lambda () (interactive) (insert "_")))
(define-key cperl-mode-map (kbd "C-c j") '(lambda () (interactive) (insert "$")))
(define-key cperl-mode-map (kbd "C-c k") '(lambda () (interactive) (insert "@")))
(define-key cperl-mode-map (kbd "C-c ;") '(lambda () (interactive)
					   (move-end-of-line 1)
					   (insert ";")))

;;; PDE stuff
;; (define-key cperl-mode-map (kbd "C-c ") 'FUNCNAME)

;;; Send region?
;;; What the hell is infperl?
;;; What pde-call-process-region is good for if there's infperl?
