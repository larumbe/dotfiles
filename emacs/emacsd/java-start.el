;; http://stackoverflow.com/questions/10625328/setting-up-emacs-23-4-cedet-1-1-and-semanticdb-to-use-gnu-global-on-windows
;; http://stackoverflow.com/questions/4173737/how-to-include-standard-jdk-library-in-emacs-semantic/10510736#10510736
;; http://my-clojure.blogspot.de/2012/05/cedet-11-emacs-java.html
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;;
;; Maven
;; Ant
;; gtags
;; semanticdb
;; malabar-mode OTRO MODO que extiende java-mode, habra que probarlo
;; flymake
;; EDE, ECB, Speedbar?
;; javap, semantic completion
;; EDE para proyectos
;; JDEE esta muerto?
;;	 http://www.emacswiki.org/emacs/JavaDevelopmentEnvironment#toc7
;; eclim completion
;;	emacs-eclim http://blog.senny.ch/blog/2012/10/13/emacs-and-java-journey-of-a-hard-friendship/
;;	ohttp://www.skybert.net/emacs/java/
;; JDEE, ECB, JDIbug, nxml mode, eclim, mavem
;;	 http://tkj.freeshell.org/emacs/java/
;; jtags
;;	Elpa
;; Snippets, descargados
;;	 https://github.com/nekop/yasnippet-java-mode
;; Anhadir class path a la lista de imports reconocidos
;; Gtags, eclim, AC, vl
;;
;; ECLIM:
;;	Download latest eclipse release 4.2?
;;	https://github.com/senny/emacs-eclim

;;;;;;;;;;;;;;;;;;
;; ECLIM DOC
;;	Completion (With autocomplete)
;;		eclim-complete M-TAB
;;	Problems and errors
;;		eclim-problems C-c C-e b ('e' or 'w' for errors and warnings 'g' refresh de display)
;;		eclim-problems-compilation-buffer C-c C-c rebound
;;		eclim-problems-correct NO FUNCIONA
;;	Projects
;;		eclim-manage-projects C-c C-e p m
;;	Code
;;		eclim-java-import-organize Adding imports C-c C-e i
;;		eclim-java-implement C-c C-e z Implementing and overriding methods?
;;	Refactoring, que sera?
;;		Refactor rename symbol at point Cc Ce r
;;	Browsing
;;		Find declaration Cc Ce f d
;;		Class hierarchy eclim-java-hierarchy C-c C-e h
;;		Types eclim-java-find-type C-c C-e f t
;;		References C-c C-e f r find method references
;;	Documentation
;;		Show doc for current element Cc Ce Cd
;;	Starting and stopping
;;		start-eclimd stop-eclimd
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; add iedit for highlighting all buffer occurences of symbol at point

;; Key definitions for semantic
;; (define-key java-mode-map (kbd "C-c m") 'semantic-ia-complete-symbol-menu)
;; semantic-ia-complete-symbol-menu: Symbol's function definition is void: senator-completion-menu-point-as-event
;; Download the development version for senator
;;
;; Como incluir los ficheros de cabecera de la classpath


;; Additional needs
;; code browser
;;	project view, classes, methods, etc
;; flymake, code quality checks on the fly
;; Buffer with all definitions
;; yasnippets especiales para java
;; which function o method mode, the current one doesn't work
;; gnu global, tags
;; eldoc mode
;; running and building the whole project
;; debugger support
;; utima version de cedet para las cosas propias de semantic

;; Maybe you won't need this because it's already in c-mode-mode
;; (add-hook 'java-mode-hook '(lambda ()
;; 			     (semantic-idle-summary-mode)
;; 			     (semantic-idle-completions-mode)
;; 			     (semantic-decoration-mode)
;; 			     (semantic-stickyfunc-mode)
;; 			     (semantic-highlight-func-mode)))

(define-key java-mode-map (kbd "C-c C-c") 'eclim-problems-compilation-buffer)
(define-key java-mode-map (kbd "C-c C-e C-d") 'eclim-java-show-documentation-for-current-element)
(define-key java-mode-map (kbd "C-c C-e C-r") 'eclim-run-class)
(define-key java-mode-map (kbd "C-c C-e p b") 'eclim-project-build)
(define-key java-mode-map (kbd "C-c u") '(lambda () (interactive) (insert " = ")))
(define-key java-mode-map (kbd "C-c i") '(lambda () (interactive) (insert " + ")))
(define-key java-mode-map (kbd "C-c ;") '(lambda () (interactive)
					   (move-end-of-line 1)
					   (insert ";\n")
					   (indent-according-to-mode)))

;; You need keybindings for running the whole project
;; (define-key java-mode-map (kbd "C-c C-r") 'java-run-project)
;; hara java 'nombre del archivo' y lo ejecutar como comando shell y mostrara los resultados en un buffer inferior

(add-hook 'java-mode-hook '(lambda ()
			   (semantic-mode) ;no funciona
			   (nlinum-mode)
			   (yas-minor-mode)
			   ;; (which-func-mode) ; no funciona
			   (eclim-mode)
			   ;; (iedit-mode t) ; esto es innecesario
			   ;; (setq-local ac-sources '(ac-source-eclim))
			   ))
