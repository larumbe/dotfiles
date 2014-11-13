;; Todo lo relacionado con autocomplete

;;; SOURCES OF INFORMATION
;; www.emacswiki.org/emacs/AutoComplete
;; 
;; When does it start? ac-trigger-commands
;; ac-dwim

(require 'auto-complete)

;; C-s para filtrar candidatos?

;; Recuerda, $HOME/.dict contiene las palabras de diccionario para ac-source-dict

;; Combinaciones basicas
;; (define-key ac-complete-mode-map (kbd "M-n") 'ac-next)
;; (define-key ac-complete-mode-map (kbd "M-b") 'ac-previous)
;; (define-key ac-complete-mode-map (kbd "TAB") 'ac-expand)
;; (define-key ac-complete-mode-map (kbd "RET") 'ac-complete)
;; (define-key ac-complete-mode-map (kbd "C-?") 'ac-help)

(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map (kbd "C-m") 'ac-show-menu)

;; Para arrancar auto-complete con una tecla en vez de automaticamente
(setq ac-auto-start t)
;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
(ac-set-trigger-key "TAB")

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
