;;; C mode stuff

;;; Sources of information
;;;	That turkish guy's youtube setup videos
;;;	 http://tuhdo.github.io/c-ide.html (IDE)

(require 'cc-mode)

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

(define-key c-mode-base-map (kbd "C-c C-j") 'helm-semantic-or-imenu)

;; Find files in projects
;; Use PROJECTILE

;; SPEEDBAR
;; Problema de incopatibilidad con numlin mode

;; Autocomplete and semantic
;; A ver que cojones pasa aqui
;; Prueba company en vez de esta mierda
(defun my:add-semantic-to-autocomplete ()
  (semantic-mode 1)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-semantic-raw))

;; Autocomplete para C headers
;; No funciona
;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;; 	    (add-to-list 'ac-sources 'ac-source-c-headers)
;; 	    (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))


(defun my:c-mode-stuff ()
  (semantic-mode)
  (nlinum-mode t)
  (which-function-mode)
  (hl-line-mode)
  (auto-complete-mode)
  (my:add-semantic-to-autocomplete)
  )
(add-hook 'c-mode-hook 'my:c-mode-stuff)





