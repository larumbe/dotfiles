;; Helm configuration
;; Use C-z C-g as a prefix ???
;; http://tuhdo.github.io/helm-intro.html (HELM GUIDE) 

;; Helm-ctags
;; https://github.com/syohex/emacs-helm-gtags 

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-z h") 'helm-command-prefix)
(global-set-key (kbd "C-z C-e") 'helm-M-x)
(global-set-key (kbd "C-'") 'helm-buffers-list)
(global-set-key (kbd "C-z y") 'helm-show-kill-ring)

(define-key helm-command-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-command-map (kbd "C-z") 'helm-select-action)
(define-key helm-command-map (kbd "C-y") 'helm-all-mark-rings)
(define-key helm-command-map (kbd "C-e") 'helm-do-grep)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; helm-package
(define-key helm-command-map (kbd "M-p") 'helm-package)

;; ac-helm
;; Modificalo para que no aparezca la ventana de autocomplete y si la de helm
;; (global-set-key (kbd "C-:") 'ac-complete-with-helm)
;; (define-key ac-complete-mode-map (kbd "C-M-;") 'ac-complete-with-helm)

;; Modifica C-] para que no sea helm-tags
(define-key helm-gtags-mode-map (kbd "C-c g C-s") 'helm-gtags-show-stack)
(define-key helm-gtags-mode-map (kbd "C-c g u") 'helm-gtags-update-tags)
(define-key helm-command-map (kbd "n") 'helm-register)
;; COMPANY

;; More functions
;; (define-key c-mode-map (kbd "C-z h y") 'helm-show-kill-ring)

