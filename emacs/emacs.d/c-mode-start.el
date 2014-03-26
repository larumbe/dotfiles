;; Everything related to C-mode initialisation
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html#fn.3
;;
;; Facilities
;;
;; Navigation
;;	semantic-fast-jump
;;	imenu says which functions
;;	Speedbar gives the same thing
;;	Which function mode
;;	Navigating between functions? C-M-a C-M-e
;;	Hay mas teclas de movimiento
;; Comprobacion de codigo
;;	Instala flymake para C
;;
;; Projects
;;	EDE
;; Documentation
;;	Show summary
;;	Describe class/struct
;;	Gtk lookup symbol
;;	Hay mas para la libreria de C
;;	C-h S info lookup

;; This should go outside any functions, loaded only once
;; Keystrokes
;; Quiza deberia ser c-mode, en vez de base, pues si no lo heredan todos los modos derivados
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For easying the display of documentation about a class or struct
(defun describe-class-at-point (class-name)
  "Marks the class at point and passes it to the underlying function"
  (interactive (list (read-string (format "Class name (%s): " (current-word)) nil nil (current-word))))
  (semantic-ia-describe-class class-name)
  (message "La clase es %s\n" class-name)    
  )

;; Killing help CEDET buffers and going back to normal editing window
;; This is rather sloppy, would prefer finding a better alternative
(defun kill-help-buffer ()
  "Kills CEDET help buffer and goes  back to edit window"
  (interactive)
  (other-window 1)
  (kill-buffer-and-window)
  )
(define-key c-mode-base-map (kbd "C-x x") 'kill-help-buffer)


;; change them to c-mode-map, so they won't affect readily affect java-mode
(defun activar-teclas ()
  "Some keystrokes useful for editing semantic-affected C code"
  (define-key c-mode-base-map (kbd "C-c s") 'semantic-ia-show-summary)
  (define-key c-mode-base-map (kbd "C-c f") 'semantic-analyze-possible-completions)
  ;; (define-key c-mode-base-map (kbd "C-c c") 'semantic-ia-describe-class)
  (define-key c-mode-base-map (kbd "C-c c") 'describe-class-at-point)
  (define-key c-mode-base-map (kbd "C-c j") 'semantic-ia-fast-jump)
  (define-key c-mode-base-map (kbd "C-c d") 'semantic-ia-show-doc)
  (define-key c-mode-base-map (kbd "C-c a") 'semantic-add-system-include)
  ;; (define-key java-mode-map (kbd "C-c m") 'semantic-ia-complete-symbol-menu) ; No funciona, mirar senator
  (define-key c-mode-base-map (kbd "C-c i") 'imenu)
  (define-key c-mode-base-map (kbd "C-c b") 'speedbar)
  (define-key c-mode-base-map (kbd "C-c C-c") 'compile)
  (define-key c-mode-base-map (kbd "C-;") 'iedit-mode)
  (define-key c-mode-base-map (kbd "C-c C-j") 'idomenu)
  (define-key c-mode-map (kbd "C-c M-f") 'flymake-mode)
  )

;; This should be outside function definitions, and be read only once upon startup
(define-key c-mode-map (kbd "C-c ;") '(lambda () (interactive)
					(move-end-of-line nil)
					(insert ";")
					;; (next-line)
					;; (move-beginning-of-line nil)
					(newline-and-indent)
					))
;; c-eldoc
;; Look at how to add even more extending the list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq c-eldoc-includes "`pkg-config glib-2.0 gtk+-2.0 --cflags` -I./ -I../")

;; GTK
;;;;;;;;
(defun activar-gtk ()
  "Adding support for gtk and glib documentation in C"
  (load-file "~/emacs/.emacs.d/gtk-look.el")
  (autoload 'gtk-lookup-symbol "gtk-look" nil t)
  (define-key c-mode-base-map (kbd "C-c g") 'gtk-lookup-symbol)
  (setq browse-url-browser-function
	'(("file:.*/usr/share/doc/libglib2.0-doc/glib" . w3m-browse-url)
	  ("file:.*/usr/share/doc/libgtk2.0-doc/gtk" . w3m-browse-url)
	  ("file:.*/usr/share/doc/libgtk2.0-doc/gobject" . w3m-browse-url)
	  ("file:.*/usr/share/doc/libgtk2.0-doc/gdk" . w3m-browse-url)
	  ("." . browse-url-firefox))))

;; CEDET and Semantic
;; Esto no esta funcionando en modo local, debe ser global
(defun semantic-settings ()
  "What its name says"
  (semantic-mode t)
  ;; Submodes
  ;; (global-semantic-idle-summary-mode)
  ;; (global-semantic-idle-completions-mode)
  ;; (global-semantic-idle-completions-mode)
  ;; (global-semantic-decoration-mode)
  ;; (global-semantic-stickyfunc-mode)
  ;; (global-semantic-highlight-func-mode)
  )


;; Autocomplete setup
(defun add-cmode-ac-sources ()
  "Adding c-mode auto-complete sources"
  (setq ac-sources '(ac-source-semantic
		     ;; ac-source-dictionary
		     ;; ac-source-imenu
		     ;; ac-source-filename
		     ac-source-words-in-same-mode-buffers)))

(activar-gtk)
(activar-teclas)
(semantic-settings)

;; System includes
(semantic-add-system-include "/usr/include" 'c-mode)
(semantic-add-system-include "/usr/local/include" 'c-mode)
(semantic-add-system-include "/usr/include/glib-2.0" 'c-mode)
(semantic-add-system-include "/usr/include/gtk-2.0" 'c-mode)
;; Consider adding yasnippet and gtags sources and dictionary files

;; Add this in every Makefile for flymake
;; check-syntax:
;;      gcc -o nul -S ${CHK_SOURCES}
;; http://emacsclub.github.io/html/flymake.html

(defun c-mode-activation ()
  "Everything necessary to bring my C environment up to work"
  (auto-complete-mode t)
  (add-cmode-ac-sources)
  (c-turn-on-eldoc-mode)
  (yas-minor-mode t)
  (nlinum-mode t)
  (which-func-mode)
  (global-semantic-idle-completions-mode)
  )

;; Finally
(add-hook 'c-mode-hook 'c-mode-activation)

;; GDB Stuff
(require 'gdb-mi)
(define-key gud-mode-map (kbd "C-c M-m") 'gdb-many-windows)
(define-key gud-mode-map (kbd "C-c M-w") 'gdb-restore-windows)
(define-key gud-mode-map (kbd "C-c M-d") 'gdb-display-disassembly-buffer)

;; HAS TOCADO gdb-setup-windows para que aparecera el register buffer en vez de locals

;; (setq gdb-show-threads-by-default )

;;;;;;;;;;;;;

;; Senator mode is not included, learn why

;; Additional features you might appreciate
;;	On-the-fly syntax checking with flymake
;;	Colouring parenthesis around function calls
;;	ECB, EDE, Speedbar, global for project development
;;	Snippets to speed up code writing (more)
;;	semantic-show-symbol like c-eldoc-mode
;;	 http://www.emacswiki.org/emacs/CScopeAndEmacs

;; (defconst my-speedbar-buffer-name "SPEEDBAR")

;;  (defun my-speedbar-no-separate-frame ()
;;     (interactive)
;;     (when (not (buffer-live-p speedbar-buffer))
;;       (setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
;;             speedbar-frame (selected-frame)
;;             dframe-attached-frame (selected-frame)
;;             speedbar-select-frame-method 'attached
;;             speedbar-verbosity-level 0
;;             speedbar-last-selected-file nil)
;;       (set-buffer speedbar-buffer)
;;       (speedbar-mode)
;;       (speedbar-reconfigure-keymaps)
;;       (speedbar-update-contents)
;;       (speedbar-set-timer 1)
;;       (make-local-hook 'kill-buffer-hook)
;;       (add-hook 'kill-buffer-hook
;;                 (lambda () (when (eq (current-buffer) speedbar-buffer)
;;                              (setq speedbar-frame nil
;;                                    dframe-attached-frame nil
;;                                    speedbar-buffer nil)
;;                              (speedbar-set-timer nil)))))
;;     (set-window-buffer (selected-window)
;;                        (get-buffer my-speedbar-buffer-name)))
