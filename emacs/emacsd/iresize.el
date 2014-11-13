(defvar iresize-mode-map 
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "C-f") 'enlarge-window-horizontally)
    (define-key m (kbd "C-b") 'shrink-window-horizontally)
    (define-key m (kbd "f") 'enlarge-window-horizontally)
    (define-key m (kbd "b") 'shrink-window-horizontally)
    (define-key m (kbd "<left>") 'enlarge-window-horizontally)
    (define-key m (kbd "<right>") 'shrink-window-horizontally)

    (define-key m (kbd "M-f") (lambda () (interactive) (enlarge-window-horizontally 3)))
    (define-key m (kbd "M-b") (lambda () (interactive) (shrink-window-horizontally 3)))

    (define-key m (kbd "C-p") 'enlarge-window)
    (define-key m (kbd "p") 'enlarge-window)
    (define-key m (kbd "<up>") 'enlarge-window)
    (define-key m (kbd "C-n") 'shrink-window)
    (define-key m (kbd "n") 'shrink-window)
    (define-key m (kbd "<down>") 'shrink-window)

    (define-key m (kbd "M-p") (lambda () (interactive) (enlarge-window 3)))
    (define-key m (kbd "M-n") (lambda () (interactive) (shrink-window 3)))    

    
    (define-key m (kbd "RET") 'iresize-mode)
    (define-key m (kbd "C-c C-c") 'iresize-mode)
    m))

(define-minor-mode iresize-mode
  :initial-value nil
  :lighter " IResize"
  :keymap iresize-mode-map
  :group 'iresize)

(provide 'iresize)