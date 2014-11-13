;; SQL customisations

;; mysql.el
;; sql-completion.el
;; sql-indent.el

;; Syntax highlighting

(defun sql-mode-activation ()
  (sql-highlight-mysql-keywords)  
  )

(add-hook 'sql-mode-hook 'sql-mode-activation)



