;;; C mode stuff

;;; Sources of information
;;;	That turkish guy's youtube setup videos
;;;	 http://tuhdo.github.io/c-ide.html (IDE)

(require 'cc-mode)
(require 'semantic)
;; Semantic no va bien, bajatelo del repositorio

;; Deberias arrancarlo con cada archivo
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-decoration-mode 1)
(semantic-mode 1)

;; Podrias poner lo anterior en eval-after-load 'cc-mode?

;; For tags, you could use either ggtags or helm-gtags

;; GGTAGS
;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;; 	      (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; Helm-gtags

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-c j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(define-key helm-gtags-mode-map (kbd "C-c g C-c") 'helm-gtags-clear-stack)
(define-key helm-gtags-mode-map (kbd "C-c g w") 'helm-gtags-find-tag-other-window)
(define-key helm-gtags-mode-map (kbd "C-c g C-g") 'ggtags-mode)

;; Imenu, como funciona esto? El asterisco
;; Esto es para ggtags, no te hace falta, pues usas Helm
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; Innecesario
(define-key c-mode-base-map (kbd "C-c C-j") 'helm-semantic-or-imenu)
(define-key c-mode-base-map (kbd "C-x i") 'idomenu)

;; Find files in projects
;; Use PROJECTILE

;; SPEEDBAR
;; Problema de incopatibilidad con numlin mode
(define-key c-mode-base-map (kbd "C-c b") 'sr-speedbar-toggle)

;; Autocomplete and semantic
;; A ver que cojones pasa aqui
;; Prueba company en vez de esta mierda
;; (defun my:add-semantic-to-autocomplete ()
;;   (semantic-mode 1)
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;;   (add-to-list 'ac-sources 'ac-source-semantic-raw))

;; Autocomplete para C headers
;; No funciona
;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;; 	    (add-to-list 'ac-sources 'ac-source-c-headers)
;; 	    (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(require 'company)
(define-key c-mode-map (kbd "<tab>") 'company-complete)
(define-key c-mode-map (kbd "C-c <tab>") 'company-gtags)
(add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-semantic-completions)

;; Aniadir soporte yasnipet a company
;; Semantic, gtags, headers
;; Para el curro, los include del sistema son los del toolchain

(defun my:c-mode-stuff ()
  (nlinum-mode t)			
  (which-function-mode)
  (hl-line-mode)
  (company-mode 1)
  (yas/minor-mode 1)
  (hs-minor-mode)
  (hide-ifdef-mode)
  (flycheck-mode)
  (rainbow-delimiters-mode)
  (diff-hl-mode)
  ;; (auto-complete-mode)
  ;; (my:add-semantic-to-autocomplete)
  )

(add-hook 'c-mode-hook 'my:c-mode-stuff)
;; (add-hook 'makefile-mode-hook 'my:c-mode-stuff)

;; Modifica los include de semantic para el SDK de Realtek

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;; function-args
(require 'function-args)
;; no functiona bien, requiere semantic
(define-key c-mode-map (kbd "M-<tab>") 'moo-complete)
(define-key c-mode-map (kbd "M-o") 'fa-show)
(define-key c-mode-map (kbd "C-z C-o") 'fa-abort)

;; yasnippet
;; helm interface?
(define-key c-mode-map (kbd "C-c y") 'yas/expand)
(define-key c-mode-map (kbd "C-c C-y") 'helm-yas-complete)
(define-key c-mode-map (kbd "C-c M-y") 'yas/exit-all-snippets)

;; Subversion
(require 'dsvn)
(define-key c-mode-map (kbd "C-c s") 'svn-status)

;; Iedit
(require 'iedit)
(define-key c-mode-map (kbd "C-;") 'iedit-mode)
(define-key iedit-mode-keymap (kbd "M-p") 'iedit-prev-occurrence)
(define-key iedit-mode-keymap (kbd "M-n") 'iedit-next-occurrence)


;; company
(define-key c-mode-map (kbd "C-c c") 'company-semantic)

;; Semantic bindings
(define-key c-mode-base-map (kbd "C-c q") 'semantic-ia-show-summary)
(define-key c-mode-base-map (kbd "C-c w") 'semantic-ia-fast-jump)
(define-key c-mode-base-map (kbd "C-c e") 'semantic-ia-show-doc)
(define-key c-mode-base-map (kbd "C-c r") 'semantic-add-system-include)
(define-key c-mode-base-map (kbd "C-c t") 'semantic-c-add-preprocessor-symbol)

;; Compilation
(define-key c-mode-base-map (kbd "C-c C-c") 'compile)
;; Debugging
(define-key c-mode-base-map (kbd "C-c C-g") 'gdb)


;;; Marking functions
(define-key c-mode-base-map (kbd "C-c d") 'mark-defun)

;; hide-ifdef
;; (add-hook 'c-mode-common-hook 'hide-ifdef-mode)
;; (setq hide-ifdef-shadow t)
;; (setq hide-ifdef-mode-prefix-key (kbd "C-c C-s"))
;; Corregir
;; (global-set-key (kbd "C-c C-s s") 'show-ifdef-block)
;; (global-set-key (kbd "C-c C-s d") 'show-ifdef-block)
(defun my:hide-macros ()
  (interactive)
  (flush-lines "#if")
  (flush-lines "#ifdef")
  (flush-lines "#else")
  (flush-lines "#endif"))

(define-key c-mode-map (kbd "C-c C-f C-l") 'my:hide-macros)
(define-key c-mode-map (kbd "C-c C-f l") 'hide-lines-show-all)

;; Makefiles
;; http://www.emacswiki.org/emacs/SmartCompile
;; Compile mode hooks
;; hay distintos makefile modes
;; (define-key makefile-mode-map (kbd "C-c C-j") 'helm-semantic-or-imenu)
;; (define-key makefile-mode-map (kbd "C-c w") 'semantic-ia-fast-jump)


;;; Common symbols
(define-key c-mode-base-map (kbd "C-c p") '(lambda () (interactive)
					     (insert "()")
					     (backward-char)))
(define-key c-mode-base-map (kbd "C-c i") '(lambda () (interactive)
					     (end-of-line)
					     (insert ";")))
(define-key c-mode-base-map (kbd "C-c ;") '(lambda () (interactive)
					     (end-of-line)
					     (insert ";")
					     (newline-and-indent)))
(define-key c-mode-base-map (kbd "C-c o") '(lambda () (interactive)
					     (insert " = ")))
(define-key c-mode-base-map (kbd "C-c u") '(lambda () (interactive)
					     (insert "_")))
(define-key c-mode-base-map (kbd "C-c [") '(lambda () (interactive)
					     (insert "->")))


(define-key c-mode-base-map (kbd "C-z M-]") 'diff-hl-next-hunk)
(define-key c-mode-base-map (kbd "C-z M-[") 'diff-hl-previous-hunk)

;;; Beginning of indentation
(define-key c-mode-base-map (kbd "C-,") 'back-to-indentation)

