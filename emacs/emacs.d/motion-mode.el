;; Minor mode for comfortable navigation when there's no editing

(defvar motion-mode-map
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "h") 'backward-char)
    (define-key m (kbd "l") 'forward-char)
    (define-key m (kbd "j") 'next-line)
    (define-key m (kbd "k") 'previous-line)
    ;; (define-key m (kbd "C-x M-z") 'motion-mode)
    m))

(define-minor-mode motion-mode
  :initial-value nil
  :lighter " MotionMode"
  :keymap motion-mode-map
  :group 'motionm)

(provide 'motionm)
(global-set-key (kbd "C-z C-v") 'motion-mode)
