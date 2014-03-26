(defvar switchwindow-mode-map 
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "k") 'windmove-up)
    (define-key m (kbd "j") 'windmove-down)
    (define-key m (kbd "l") 'windmove-right)
    (define-key m (kbd "h") 'windmove-left)    
    
    (define-key m (kbd "RET") 'switchwindow-mode)
    m))

(define-minor-mode switchwindow-mode
  :initial-value nil
  :lighter "SwitchWindow"
  :keymap switchwindow-mode-map
  :group 'switchwindow)

(provide 'switchwindow)
