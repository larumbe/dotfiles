;; nXhtml, lo mas importante
;; MuMamMo, para Php al mismo tiempo
;; Mira el debugger que mencionan por ahi, Gebn, Xdebug
;; Actualiza el systema para meter flymake-php
;; Global para navegar por funciones, o etags
;; 

;; (defun company-my-php-backend (command &optional arg &rest ignored)
;;   (case command
;;     ('prefix (and (eq major-mode 'php-mode)
;; 		  (company-grab-symbol)))
;;     ('sorted t)
;;     ('candidates (all-completions
;; 		  arg 
;; 		  (if (and (boundp 'my-php-symbol-hash)
;; 			   my-php-symbol-hash)
;; 		      my-php-symbol-hash
		    
;; 		    (message "Fetching completion list...")

;; 		    (with-current-buffer
;; 			(url-retrieve-synchronously "http://php.net/quickref.php")

;; 		      (goto-char (point-min))

;; 		      (if (re-search-forward "<!-- result list start -->" nil t)
;; 			  (let ((end (save-excursion
;; 				       (if (re-search-forward "<!-- result list end -->" nil t)
;; 					   (point)))))
;; 			    (if end
;; 				(let ((hash (make-hash-table)))
;; 				  (while (re-search-forward ">\\([^<]+\\)</a>" end t)
;; 				    (puthash (match-string 1) t hash))
;; 				  (setq my-php-symbol-hash hash)))))))))))

;; Mira web-mode
;; Poner un buffer inferior para la documentacion con w3m
;; Poder enviarlo todo rapidamente a www/docs
;; 
;; Necesitas:
;;	Completar: completado de php-mode, php-completion-mode, usar etags
;;	Documentacion: php-doc, configurarlo para que use w3m
;;	Info de parametros, php-eldoc-mode
;;	Correccion al aire: flymake-php
;;	Plantillas: Recopilar plantillas de yassnippet para php
;;	GEBEN para depuracion basica, pero esta sin mantener
;; 11 down vote accepted
	

;; I personally use the .chm version of the manual - there are plenty of chm file readers for linux and OSX out there that can be used. It also offers integrated search, which is the main plus for it. The english chm download is also offered with the user notes included.

;; Also, php.net offers a the php manual as man pages, installable via PEAR - it's awesome to integrate into i.e. emacs or vim.

;; $ pear channel-discover doc.php.net
;; $ pear install doc.php.net/pman
;; $ pman strpos

;; Tambien
;; https://github.com/ejmr/php-auto-yasnippets



;;
;;

;; Maneras de implementarlo:
;;	php-mode, php+-mode (where are the differences)
;;	nXhtml
;;	MuMaMo
;;	web-mode

;; (load-file "~/.emacs.d/elpa/php+-mode-20121129.1452/php+-mode.el")
(load-file "~/emacs/.emacs.d/php-completion.el")
;; (require 'php+-mode)
;; (require 'php-completion)

;; (setq php+-path "~/.emacs.d/elpa/php+-mode-20121129.1452/php+-mode.el")
;; (setq php-comp-path "~/emacs/.emacs.d/php-completion.el")
;; (load-file php+-path)
;; (load-file "~/.emacs.d/elpa/flymake-easy-20130106.1817/flymake-easy.el")
;; (load-file "~/.emacs.d/elpa/flymake-php-20121104.1902/flymake-php.el")
;; (load-file php-comp-path)

(require 'php+-mode)
(require 'php-completion)
(require 'flymake-easy)
(require 'flymake-php)

(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))

;; Mode-wide options
(setq php-search-url "http://www.php.net/")
(define-key php+-mode-map (kbd "C-c o") 'phpcmp-complete)
(define-key php+-mode-map  (kbd "C-c q") 'my-php-symbol-lookup)
(define-key php+-mode-map (kbd "C-c w") 'html-mode)
;; (setq browse-url-browser-function '(("." . w3m-browse-url)))
;; Esta definido en .emacs

;; Hay funcionalidad definida en el modo, que raro
;; (defun php-tags ()
;;   (interactive)
;;   (message "building project tags")
;;   (let ((root))
;;     (setq root (expand-file-name (read-directory-name "Project top dir: ")))
;;     (shell-command (concat "find . -name \*.module -o -name \*.php -o -name \*.inc -o -name \*.install -o -name \*.engine -o -name \*.profile | etags -l php -" root "TAGS " root)))
;;   (message "tags built successfully"))

;; Esto hay que mejorarlo como sea
(defun php-tags ()
  "Create PHP tags table"
  (interactive)
  (shell-command "find . -name \"\*.php\" -print | etags -"))

;; Para que servira esto?
(setq php-manual-path "/usr/share/doc/php-doc/")

(defun init-php ()
  "Everything I want loaded for php files"
  (php-completion-mode t)
  (php-eldoc-enable)
  ;; (flymake-mode t)
  ;; (flymake-php-load)
  (yas-minor-mode t)
  )

;; Cambialo, pero no hay html-mode-map
(defun init-html ()
  (local-set-key (kbd "C-c w") 'php+-mode)
  )

(add-hook 'html-mode-hook 'init-html)
(add-hook 'php+-mode-hook 'init-php)

;; Mira wisent-php LARL grammar

;; Cosas que te faltan
;;	Saltar a la defincion de un simbolo cualquiera
;;	Completar variables del mismo buffer o metodos de clases
