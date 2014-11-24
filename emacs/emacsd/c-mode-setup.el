;;; C mode stuff

;;; Sources of information
;;;	That turkish guy's youtube setup videos
;;;	 http://tuhdo.github.io/c-ide.html (IDE)

(require 'cc-mode)
(require 'semantic)
;; Semantic no va bien, bajatelo del repositorio

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)  
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

;; Imenu, como funciona esto? El asterisco
;; Esto es para ggtags, no te hace falta, pues usas Helm
;; (setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; Innecesario
(define-key c-mode-base-map (kbd "C-c C-j") 'helm-semantic-or-imenu)

;; Find files in projects
;; Use PROJECTILE

;; SPEEDBAR
;; Problema de incopatibilidad con numlin mode

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
  ;; (auto-complete-mode)
  ;; (my:add-semantic-to-autocomplete)
  )

(add-hook 'c-mode-hook 'my:c-mode-stuff)

;; Modifica los include de semantic para el SDK de Realtek

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;; function-args
(require 'function-args)
;; no functiona bien, requiere semantic
(define-key c-mode-map (kbd "C-c m") 'moo-complete)
(define-key c-mode-map (kbd "M-o") 'fa-show)
(define-key c-mode-map (kbd "C-z C-o") 'fa-abort)

;; yasnippet
;; helm interface?
(define-key c-mode-map (kbd "C-c y") 'yas/expand)
(define-key c-mode-map (kbd "C-c C-y") 'helm-yas-complete)

;; Subversion
(require 'dsvn)
(define-key c-mode-map (kbd "C-c s") 'svn-status)

;; ieditmode
(define-key c-mode-map (kbd "C-;") 'iedit-mode)

;; company
(define-key c-mode-map (kbd "C-c c") 'company-semantic)

;; Semantic bindings
(define-key c-mode-base-map (kbd "C-c q") 'semantic-ia-show-summary)
(define-key c-mode-base-map (kbd "C-c w") 'semantic-ia-fast-jump)
(define-key c-mode-base-map (kbd "C-c e") 'semantic-ia-show-doc)
(define-key c-mode-base-map (kbd "C-c r") 'semantic-add-system-include)

;; Compilation
(define-key c-mode-base-map (kbd "C-c C-c") 'compile)



