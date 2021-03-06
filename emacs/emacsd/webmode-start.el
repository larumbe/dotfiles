;; All about web programming
;; http://www.emacswiki.org/emacs/HtmlMode

;; web-mode
;; http://www.reddit.com/r/emacs/comments/1wkigv/web_development_with_emacs_newbie/
;; http://web-mode.org/
;; Needs
;; -----
;; web-mode
;; js2.el
;; yas-snippet
;; auto-complete-mode
;; zen-coding
;; sass-mode
;; scss-mode
;; php-boris
;; ---------
;; web-mode initialisation
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; There are more modes to add in here

;; nXhtmlm ;;
;; Instalacion
;; https://bazaar.launchpad.net/~nxhtml/nxhtml/main/download/head:/webvcs.el-20091227180846-favloh4bvxp3i0mh-4/web-vcs.el
;; http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html
;; Instalacion alternativa
;; http://ourcomments.org/cgi-bin/emacsw32-dl-latest.pl

;; CSS
;; WIKI: http://www.emacswiki.org/emacs/CascadingStyleSheetMode

;;; js2
;;; http://www.emacswiki.org/emacs/Js2Mode
;;; http://www.emacswiki.org/emacs/EmacsJs
;;;	Standard configuration for javascript, read its code

(define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer)

(defun webmodeall ()
  "All about webmode"
  (interactive)
  (web-mode)
  (js2-minor-mode)
  (yas-minor-mode)
  (auto-complete-mode)
  )

;;; js-coming, hay mas, skew, SLIME, etc?
;;; http://js-comint-el.sourceforge.net/
;;; Mira como usar spidermonkey o node, que es eso?

(require 'js-comint)
(setq inferior-js-program-command "/usr/bin/rhino")
(add-hook 'js2-mode-hook '(lambda () 
			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
			    (local-set-key "\C-cb" 'js-send-buffer)
			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			    (local-set-key "\C-cl" 'js-load-file-and-go)
			    ))

(define-key js2-mode-map (kbd "C-c C-r") 'js-send-region)

;;; Javascript resources
;;; Books: Javascript, the good parts
;;; Interpreters and engines?
