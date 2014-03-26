;; Everything about maple mode, see:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; - http://www.mapleprimes.com/posts/41952-MapleV-An-Emacs-Mode-For-Maple (1)
;; - http://www-spiral.lip6.fr/~vmm/fr/Enseignement/Maitrise/maple-mode.html (1)
;; - http://www.emacswiki.org/emacs/WikifiedEmacsLispList , un par de ellos (1) (2)
;; - https://github.com/JoeRiel/maplev (1)
;; - http://schwieters.org/cds/maple-mode.el (2)
;; - http://www.mapleprimes.com/posts/95182-Emacs-Debugger-For-Maple (Debugger)
;; - http://omega.albany.edu:8008/maple2html/ (Para hacerlo legible)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plots:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;; - http://www.maplesoft.com/support/help/Maple/view.aspx?path=plotsetup
;; - http://www.maplesoft.com/support/help/Maple/view.aspx?path=plot/device

(setq load-path (cons (format "%s/emacs/.emacs.d/maple" (getenv "HOME")) load-path))
(autoload 'maplev "maplev" "Maple editing mode" t)
(setq 
 auto-mode-alist (cons (cons (concat "\\." (regexp-opt '("mpl" "tst") t)
				     "$")
			     'maplev-mode)
		       auto-mode-alist)
 maplev-copyright-owner "Joseph S. Riel" ; this is for applying copyrights to Maple code you create
 ;; maplev-default-release "15"
 maplev-default-release "11" 
 ;; maplev-executable-alist 
 ;; '(
 ;;   ("15" . ("maple15" nil "mint15"))
 ;;   ("14" . ("maple14" nil "mint14"))
 ;;   ("13" . ("maple13" nil "mint13")))
 maplev-executable-alist 
 '(
   ("11" . ("/opt/maple11/bin/maple" nil "/opt/maple11/bin/mint")))
 maplev-mint-query nil
 maplev-description-quote-char ?\"
 )

(setq maplev-insert-copyright-flag nil)

;; ESTA MIERDA NO TIENE HOOK?

(defun maplev-hook ()
  "This mode doesn't have a hook, run it manually"
  (interactive)
  (which-function-mode t)
  (auto-complete-mode t)
  )

(define-key maplev-mode-map (kbd "C-c M-h") 'maplev-hook)
(define-key maplev-mode-map (kbd "C-c h") 'maplev-help-at-point)
(define-key maplev-mode-map (kbd "C-c r") 'maplev-cmaple-send-region)
(define-key maplev-mode-map (kbd "C-c l") 'maplev-cmaple-send-line)
(define-key maplev-mode-map (kbd "C-q M-d") 'maplev-what-proc)
(define-key maplev-mode-map (kbd "C-h") 'delete-backward-char)
(defun print-arrow () (interactive) (insert " -> "))
(define-key maplev-mode-map (kbd "C-'") 'print-arrow)
(define-key maplev-mode-map (kbd "C-c c") '(lambda () (interactive) (kill-buffer "*Completions*")))
(define-key maplev-mode-map (kbd "C-c z") '(lambda () (interactive)
					     (split-window-right)
					     (switch-to-buffer-other-window "Maple 11")))
(define-key maplev-mode-map (kbd "C-c m") 'maplev-untab)

(define-key maplev-mode-map (kbd "C-c u") '(lambda () (interactive) (insert "+")))
(define-key maplev-mode-map (kbd "C-c i") '(lambda () (interactive) (insert "-")))
(define-key maplev-mode-map (kbd "C-c o") '(lambda () (interactive) (insert "*")))
(define-key maplev-mode-map (kbd "C-c p") '(lambda () (interactive) (insert "/")))
(define-key maplev-mode-map (kbd "C-c j") '(lambda () (interactive) (insert "^")))
(define-key maplev-mode-map (kbd "C-c k") '(lambda () (interactive) (insert "=")))
(define-key maplev-mode-map (kbd "C-c ;") '(lambda () (interactive)
					     (move-end-of-line 1)
					     (insert ";")))
(define-key maplev-mode-map (kbd "C-c C-p") '(lambda () (interactive) (insert "()") (backward-char)))



