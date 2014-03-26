;; Short documentation for elpy: https://github.com/jorgenschaefer/elpy/wiki/Usage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion
;;	See the different facilities
;; C-; iedit-mode
;;	highlighting all ocurrences of string in the buffer
;; Mira narrow mode
;;	C-x n n narrow
;;	C-x n w widen
;;	C-x n d narrow current function
;; Snippet expansion
;;	C-c C-y anything-yassnipet selection
;; Editing code
;;	M-q filling region
;;	C-c < y C-c > shifting region blocks aside
;; Navigation
;;	C-M-u Closest opening definition
;;	M-n y M-p backward and forward definition
;;	C-c C-j idomenu, for fast definition selection
;;	C-c C-o buffer with all definitions
;;	C-c C-q tells you where you are
;;	M-. jump to definition of symbol at point
;;	C-c i imenu
;; Flymake
;;	C-c C-n C-c C-p flymake next and previoys error
;;	C-c C-v flymake compile
;;	C-c C-t running tests /bin/bash: nosetests: no se encontró la orden
;; Projects
;;	C-c C-f search file in current project
;;	Speedbar or ECB?
;;	C-c C-s search for symbol at point (like tags)
;;	C-u C-c C-s same, but prompts for a string to search for
;;	elpy-set-project-root
;; Interactive shell
;;	C-c C-z switch to shell
;;	C-c C-c send buffer
;;	C-M-x send defun
;; Documentation
;;	C-c C-d show documentation of symbol at point
;;	C-u C-c C-d Pydoc on symbol at point
;;	C-c C-w websearch
;;	C-c h pylookup on local file
;; Quality tests
;;	TODO Nosetest?
;; Refactoring
;;	C-c C-r explore this
;; Ipython-anything
;;	?

;; TODO Virtualenv and Nosemacsa
;; Multiple testing tools
;;	flymake, pyflakes,pep8, pylint
;; Add new snippets
;; See what's wrong with python-eldoc

;; (require 'anything-ipython)		
;; (add-hook 'python-mode-hook #'(lambda ()
;;                                  (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))
;;  (add-hook 'ipython-shell-hook #'(lambda ()
;;                                    (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))

(define-key python-mode-map (kbd "C-c C-e") 'python-eldoc-at-point) ; I think this is not working
(define-key python-mode-map (kbd "C-;") 'iedit-mode)

;; Pylookup
(load-file "~/emacs/.emacs.d/pylookup/pylookup.el")
(setq pylookup-program "~/emacs/.emacs.d/pylookup/pylookup.py")
(setq pylookup-db-file "~/emacs/.emacs.d/pylookup/pylookup.db")
(define-key python-mode-map (kbd "C-c h") 'pylookup-lookup)

;; Symbols
(define-key python-mode-map (kbd "C-c j") '(lambda () (interactive) (insert " = ")))
(define-key python-mode-map (kbd "C-c k") '(lambda () (interactive) (insert "_")))

					    
(defun python-mode-activation ()
  "Everything I want when entering python source files"
  (pretty-lambda-mode t)
  (nlinum-mode)
  (which-func-mode)
  (semantic-mode t)
  (elpy-set-backend "jedi")  
  ;; (global-semantic-decoration-mode)
  )

(add-hook 'python-mode-hook 'python-mode-activation)

;; ipython con python-mode
;; Consider instilling python-mode.el
;; pyflakes, plint, etc



  
