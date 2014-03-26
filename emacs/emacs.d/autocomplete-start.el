;; Todo lo relacionado con autocomplete

;; www.emacswiki.org/emacs/AutoComplete
;; 
;; Extensions:
;;	Clang sources
;;	Readline completion for shellmode
;;
;; Como marcar nuevas fuentes (sources) para Auto Complete
;; What is omnicompletion?
;; Mixing it with company?
;;
;; When does it start? ac-trigger-commands
;; ac-dwim
;; 
;; Funciones:
;;	ac-expand
;;	ac-complete
;;	ac-next
;;	ac-previous
;;	ac-help
;;

;; Para que sera esto
;; (ac-config-default)

;; C-s para filtrar candidatos?

;; Recuerda, $HOME/.dict contiene las palabras de diccionario para ac-source-dict

;; Combinaciones basicas
;; (define-key ac-complete-mode-map "\M-n" 'ac-next)
;; (define-key ac-complete-mode-map "\M-p" 'ac-previous)
;; (define-key ac-complete-mode-map "\t" 'ac-expand)
;; (define-key ac-complete-mode-map "\n" 'ac-complete)
(define-key ac-complete-mode-map (kbd "M-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "M-b") 'ac-previous)
(define-key ac-complete-mode-map (kbd "TAB") 'ac-expand)
(define-key ac-complete-mode-map (kbd "RET") 'ac-complete)

;; Para arrancar auto-complete con una tecla en vez de automaticamente
(setq ac-auto-start nil)
;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
(ac-set-trigger-key "TAB")
;; (ac-set-trigger-key "C-c y")
;; (ac-set-trigger-key "C-x x")

;; Para comenzar el completado tras un cierto numero de caracteres
;; (setq ac-auto-start 4)

;; Diccionario
;; ac-clear-dictionary-cache para recargar diccionarios
;; user-defined, major mode dictionary, extension dictionary
;; Adding ac-source-dictionary to ac-sources
;; (add-to-list 'ac-sources 'ac-source-dictionary)

;; ac-sources contiene las fuentes de palabras para completar
;; User defined
;;	ac-user-dictionary ac-user-dictionary-files
;;
;; Major mode dictionary
;; ac-dictionary-directories
;; Necesitas uno para elisp

;; SOURCE
;; Para un modo concreto:
;;	1 Definir una funcion para cambiar ac-sources
;;	2 Registrar la funcion con el gancho
