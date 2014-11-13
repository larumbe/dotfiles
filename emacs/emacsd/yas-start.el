;; Everything about running yas-snippet mode

;; Write the name of the dir where you keep them stored
;; (setq yas-snippet-dirs "~/.emacs.d/elpa/yasnippet-20130218.2229/snippets/")

;; Changing the trigger key
;; (setq yas-trigger-key "C-c y")

;; Mira en elpa, helm interface anything ya esta disponible
;; Yassnippet anything interface
(load-file "~/.emacs.d/anything-c-yasnippet-2.el")
(define-key yas-minor-mode-map (kbd "C-c C-y") 'anything-yasnippet-2)
;; Su manual es una mierda, dice que deberia ser asi, no obstante es como en la siguiente linea
;; (setq yas-trigger-key "C-c & y")
;; (setq yas/trigger-key "C-c & y")
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c y") 'yas-expand)

;; Forewritten snippets
;; Tendras que ponerlo como hook
(yas-load-directory "~/.emacs.d/elpa/yasnippet-20130907.1855/snippets/")

;; More user-contributed templates

