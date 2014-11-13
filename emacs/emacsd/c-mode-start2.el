;;; C mode stuff

;;; Sources of information
;;;	That turkish guy's youtube setup videos

(require 'semantic)

;;; C headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;; flymake mode, flymake-cursor-mode
(add-hook 'c-mode-hook 'flymake-mode)

;;; Semantic mode for CEDET
(add-hook 'c-mode-hook 'semantic-mode)
(defun my:add-semantic-to-autocomplete ()
  (semantic-mode 1)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-semantic-raw))
(add-hook 'c-mode-hook 'my:add-semantic-to-autocomplete)

;; Semantic system includes (maybe there's another form to do this, ede root project)
(semantic-add-system-include "/usr/include" 'c-mode)
(semantic-add-system-include "/usr/local/include" 'c-mode)
(semantic-add-system-include "/usr/include/glib-2.0" 'c-mode)
(semantic-add-system-include "/usr/include/gtk-2.0" 'c-mode)

;;; Semantic modes
(add-hook 'c-mode-hook '(lambda () (interactive) 
			  (global-semantic-idle-summary-mode)
			  (global-semantic-idle-completions-mode)
			  (global-semantic-decoration-mode)
			  (global-semantic-highlight-func-mode)))

;;; Yasnippet shit
(add-hook 'c-mode-hook 'yas-minor-mode)

;;; Other modes
(defun my:c-mode-stuff ()
  (nlinum-mode t)
  (which-function-mode)
  (hl-line-mode))
(add-hook 'c-mode-hook 'my:c-mode-stuff)

;;; Other key mappings
(define-key c-mode-base-map (kbd "C-c s") 'semantic-ia-show-summary)
(define-key c-mode-base-map (kbd "C-c j") 'semantic-ia-fast-jump)
(define-key c-mode-base-map (kbd "C-c d") 'semantic-ia-show-doc)
(define-key c-mode-base-map (kbd "C-c a") 'semantic-add-system-include)
(define-key c-mode-base-map (kbd "C-c b") 'speedbar)
(define-key c-mode-base-map (kbd "C-c C-c") 'compile)
(define-key c-mode-base-map (kbd "C-;") 'iedit-mode)
(define-key c-mode-base-map (kbd "C-c C-j") 'idomenu)

(define-key c-mode-map (kbd "C-c ;") '(lambda () (interactive)
					(move-end-of-line nil)
					(insert ";")
					(newline-and-indent)
					))

;;; Flymake navigation
(define-key c-mode-map (kbd "C-c C-f") 'flymake-goto-next-error)
(define-key c-mode-map (kbd "C-c C-b") 'flymake-goto-prev-error)

;;; Helm interface for gnuglobal or etags
;;; Cwarn mode
;;; Clang competion
