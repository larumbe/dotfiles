;; Everything about shell mode

;;;;;;;;;;;;;;;;;
;; This is a short wishlist I've compiled that pretty much sums up
;; everything I was looking for when I wrote the post:
;;;;;;;;;;;;;;;;;;
;; - Code completion of shell bultins and previously defined functions
;;         (I guess this could be done by writing a wordlist for autocomplete mode) [DONE]
;; - Navigation: imenu, buffer definitions, etags, gtags?
;;         (I'm wondering whether etags has shell scripting support, I'll
;;         look this up myself) [DONE, Imenu]
;; - Flymake for shell
;;         (There seems to be a mode for this on elpa repositories) [DONE (Doesn't work)]
;; - Interaction with lower process
;;         (It'd be awesome if I could send arbitrary regions into the
;;         shell for immediate execution) [DONE, send region]
;; - Online Documentation of shell builtins
;;         (I guess the best way is turning to woman and reading the
;;         matching section) [WOMAN]
;; - Yassnippet library [DONE]
;;         (The sh scripting mode that ships with emacs has predefined
;;         functions for skeletons of common constructs, but I think this
;;         is unnecessary if you put it all into a yasnipet mode directory)
;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; This shit is for bash-competion ;;;;;;;;;;;;;;
;; bash-completion (elpa)
;; shell-command.el (for minibuffer cmpletion)
;;;;;;;;;;;;;;
;; (autoload 'bash-completion-dynamic-complete \"bash-completion\"
;;   \"BASH completion hook\")
;; (add-hook 'shell-dynamic-complete-functions
;; 	  'bash-completion-dynamic-complete)
;; (add-hook 'shell-command-complete-functions
;; 	  'bash-completion-dynamic-complete)
;;
;; (require 'bash-completion)
;; (bash-completion-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Carga yasnippets en .emacs.d/libs/yasnippet/sh-mode
;; Bash shell debugger
;; http://www.shellcheck.net/about.html (Shell check)
;; On the fly syntax checking
;;	http://stackoverflow.com/questions/171924/how-do-i-check-syntax-in-bash-without-running-the-script
;;	Parece que no funciona

;; Tendras que hacer
;; Documentacion, con woman y shell builtins
;; Ver que esta mal con flymake shell
;; Usar shcheck en libs, ver como mejorarlo
;; 

;;; Standard mode is shit
(unload-feature 'sh-script)
(load-file "./libs/sh-script.el")

;; Hooks
(add-hook 'sh-mode-hook 'nlinum-mode)
(add-hook 'sh-mode-hook 'yas-minor-mode)
(add-hook 'sh-mode-hook 'flymake-shell-load)
(add-hook 'sh-mode-hook 'hl-line-mode)
;; Anhadir snippets de yasnippet

;;; Flymake setup
;;; Borra esto y mira que tal funciona la proxima vez
(require 'flymake-shell)
(add-hook 'sh-mode-hook 'flymake-shell-load)

;;; Code completion
;;; Create bash keyword dictionary

;;; Navigation
(define-key sh-mode-map (kbd "C-c C-j") 'idomenu)

;;; Flymake navigation
(define-key sh-mode-map (kbd "C-c f") 'flymake-goto-next-error)
(define-key sh-mode-map (kbd "C-c b") 'flymake-goto-prev-error)

;;; Code execution
(define-key sh-mode-map (kbd "C-c r") 'sh-execute-region)

;;; Documentation
(define-key sh-mode-map (kbd "C-c i") 'info-lookup-symbol)
(defun my:bash-builtin-info ()
  (interactive)
  (shell-command (concat "help " (thing-at-point 'word))))
(define-key sh-mode-map (kbd "C-c h") 'my:bash-builtin-info)





