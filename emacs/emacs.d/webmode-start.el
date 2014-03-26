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
;;


