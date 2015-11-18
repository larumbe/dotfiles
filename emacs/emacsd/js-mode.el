;;; http://emacs.stackexchange.com/questions/3093/how-to-navigate-a-javascript-project
;;; http://marijnhaverbeke.nl/blog/tern.html

;;; js2-mode
;;;	https://github.com/mooz/js2-mode
;;; 
;;; REPL
;;;	Skewer
;;;	Swank
;;;
;;;	tern-mode
;;; Debugpging?
;;; ctags


    ;; js2-mode
    ;; js2-imenu-extras-mode (for quick access to functions)
    ;; flyspell with jshint
    ;; skewer-mode (for interacting with the browser)
    ;; js-comint (repl for nodejs)
    ;; yasnippet
    ;; smartparens
    ;; hs-minor-mode (for hiding/showing code blocks)
;;;  ternjs



(define-key js2-minor-mode-map (kbd "C-c y") 'yas/expand)
(define-key js2-minor-mode-map (kbd "C-c C-y") 'helm-yas-complete)
(define-key js2-minor-mode-map (kbd "C-c M-y") 'yas/exit-all-snippets)

(defun my:js2-start ()
  "All about Javascript"
  (interactive)

  ;; (paredit-mode)
  (tern-mode)
  (company-mode)
  (yas-minor-mode)
  (skewer-mode)
  (electric-indent-mode)
  (js2-minor-mode)
  )

(add-hook 'js2-mode-hook 'my:js2-start)



(define-key js2-minor-mode-map (kbd "C-c w") 'web-mode)
(define-key web-mode-map (kbd "C-c j") 'js2-mode)

(define-key js2-minor-mode-map (kbd "C-c i") '(lambda () (interactive)
					     (end-of-line)
					     (insert ";")))
(define-key js2-minor-mode-map (kbd "C-c ;") '(lambda () (interactive)
					     (end-of-line)
					     (insert ";");
					     (newline-and-indent)))
(define-key js2-minor-mode-map (kbd "C-c o") '(lambda () (interactive)
					     (insert " = ")))
(define-key js2-minor-mode-map (kbd "C-c u") '(lambda () (interactive)
					     (insert "_")))

(define-key js2-minor-mode-map (kbd "C-c c") 'company-tern)

