
;;; Architecture (http://www.emacswiki.org/emacs/PythonProgrammingInEmacs)
;;;	python.el (python-mode.el is the alternative)
;;;	elpy
;;;	jedi
;;;	Helpers: flymake, yasnippet, autocomplete (further code checkers)
;;;	Documentation: Several independent tools
;;;	pdb (debugger?) (pdb, pydb)
;;;	python shell (ipython, python)
;;;	virtualenv

;;; Emacs as a python IDE: https://www.youtube.com/watch?v=6BlTGPsjGJk

;;; python-mode.el
;;; http://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl
;;; https://ep2013.europython.eu/conference/p/andrea-crotti resp. http://www.youtube.com/watch?v=0cZ7szFuz18

;;; python.el (ships with emacs)
;;; http://www.emacswiki.org/emacs/ProgrammingWithPythonDotElGallina
;;; Replace keystrokes shadowed by elpy, and investigate them

;;; ELPY
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
;;;	not elpy-based	
;;		C-c h pylookup on local file
;;;		C-q S info lookup
;;;		C-c ? jedi:show-doc
;; Quality tests
;;	TODO Nosetest?
;; Refactoring
;;	C-c C-r explore this
;; Ipython-anything
;;	?

;;; Jedi has new keybindings


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

(elpy-enable)
(elpy-use-ipython)

;; (define-key python-mode-map (kbd "C-c C-e") 'python-eldoc-at-point) ; I think this is not working
(define-key python-mode-map (kbd "C-;") 'iedit-mode)

(setq elpy-rpc-backend "jedi")

;; Pylookup
;; (load-file "~/emacs/.emacs.d/pylookup/pylookup.el")
;; (setq pylookup-program "~/emacs/.emacs.d/pylookup/pylookup.py")
;; (setq pylookup-db-file "~/emacs/.emacs.d/pylookup/pylookup.db")
;; (define-key python-mode-map (kbd "C-c h") 'pylookup-lookup)

;;; Info
(define-key python-mode-map (kbd "C-c i") 'info-lookup-symbol)

;; Symbols
(define-key python-mode-map (kbd "C-c j") '(lambda () (interactive) (insert " = ")))
(define-key python-mode-map (kbd "C-c k") '(lambda () (interactive) (insert "_")))


(defun python-mode-activation ()
  "Everything I want when entering python source files"
  (pretty-lambda-mode t)
  (nlinum-mode)
  (which-func-mode)
  (semantic-mode t)
  (highlight-indentation-mode t)
  (jedi:setup)
  ;; (elpy-set-backend "jedi")
  )

(add-hook 'python-mode-hook 'python-mode-activation)

;; ipython con python-mode
;; Consider instilling python-mode.el
;; pyflakes, plint, etc

;;; Flymake navigation
(define-key python-mode-map (kbd "C-c f") 'flymake-goto-next-error)
(define-key python-mode-map (kbd "C-c b") 'flymake-goto-prev-error)

;;; Jedi
;;; http://tkf.github.io/emacs-jedi/latest/
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(define-key python-mode-map (kbd "C-c d") 'jedi:show-doc)


;;; YAS
(define-key python-mode-map (kbd "C-c C-y") 'helm-yas-complete)

;;;xp Jedi doc window too big

;;; configure
;;; jedi:tooltip-method
;;; jedi-direx

;;; read about
;;; EPC, deferred.el, python-environment.el
;;; virtualenv
;;; jedi, python-epc, argparse


