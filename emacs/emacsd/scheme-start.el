;;; All about scheme programming

;;; Geiser
;;; http://www.nongnu.org/geiser/
;;; run-geister

(define-key scheme-mode-map (kbd "C-c C-g") '(lambda () (interactive) (run-geiser 'guile)))

(define-key scheme-mode-map (kbd "C-'") '(lambda () (interactive) (insert "-")))

