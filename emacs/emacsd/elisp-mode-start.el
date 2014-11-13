;; Todo lo relacionado con elisp

;; Use ‘C-x ESC ESC’ to repeat commands you execute, and look at the Emacs-Lisp code that executes them, before hitting ‘RET’ (Return) – see RepeatLastCommand.
;; http://www.fincher.org/tips/Languages/Emacs.shtml
;; M-: eval expression

;; ielm as an inferior process?
;; C-M-x eval defun
;; TAGS?
;; http://www.emacswiki.org/emacs/ParEdit
;; http://www.emacswiki.org/emacs/EmacsNewbieWithIcicles
;; http://www.emacswiki.org/emacs/Icicles_-_Nutshell_View

;; This should go somewhere else
(define-prefix-command 'Apropos-Prefix nil "Apropos (a,c,d,l,v,C-v)")
(global-set-key (kbd "C-q C-a") 'Apropos-Prefix)
(define-key Apropos-Prefix (kbd "a")   'apropos)
(define-key Apropos-Prefix (kbd "C-a") 'apropos)
(define-key Apropos-Prefix (kbd "c")   'apropos-command)
(define-key Apropos-Prefix (kbd "d")   'apropos-documentation)
(define-key Apropos-Prefix (kbd "l")   'apropos-library)
;; (define-key Apropos-Prefix (kbd "s")   'apropos-symbol)
(define-key Apropos-Prefix (kbd "v")   'apropos-variable)
(define-key Apropos-Prefix (kbd "C-v") 'apropos-value)

;; (global-set-key (kbd "C-h C-f") 'find-function)
;; (define-key emacs-lisp-mode-map (kbd "C-h C-f") 'find-function)
(define-key emacs-lisp-mode-map (kbd "C-c i") 'imenu)
(define-key emacs-lisp-mode-map (kbd "C-c b") 'speedbar)
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-j") 'idomenu)
(define-key emacs-lisp-mode-map (kbd "C-c C-s") 'speedbar)
(define-key emacs-lisp-mode-map (kbd "C-c e") 'ielm)
(define-key emacs-lisp-mode-map (kbd "C-;") 'iedit-mode)
;; (define-key emacs-lisp-mode-map (kbd "C-c s") '(lambda () (interactive) (symbolp (symbol-at-point))))
;; (define-key emacs-lisp-mode-map (kbd "C-c C-e") 'ecb-activate)
;; (define-key emacs-lisp-mode-map (kbd "C-c M-e") 'ecb-deactivate)


;;; completation: Recuerda usar C-M-i (completion-at-point), es mas rapido que autocomplete

;; I hate having to draw my hand so far away for typing the hyphen character
(defun print-hyphen () (interactive) (insert-char ?-))
(define-key emacs-lisp-mode-map (kbd "C-'") 'print-hyphen)
;;; With paredit, this seems to be useless
;; (define-key emacs-lisp-mode-map (kbd "C-c C-p") '(lambda () (interactive) (insert "()") (backward-char)))
(define-key emacs-lisp-mode-map (kbd "C-c C-p") 'paredit-open-round)

;; Como hacer que una variable solo en un modo
;; Haz algo para que esto se haga una sola vez, no en cada entrada en elisp-mode
(defun add-elisp-ac-sources ()
  "Adding elisp auto-complete sources"
  (setq ac-sources '(ac-source-features
		     ac-source-filename
		     ac-source-functions
		     ac-source-symbols
		     ac-source-variables
		     ac-source-words-in-same-mode-buffers)))

(defun elisp-activation ()
  "Everything necesssary to bring my elisp environment up to work"
  (interactive)
  (auto-complete-mode t)
  (add-elisp-ac-sources)
  (eldoc-mode t)
  (yas-minor-mode t)
  (nlinum-mode)
  (pretty-lambda-mode t)
  (paredit-mode)
  (paren-face-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'elisp-activation)
