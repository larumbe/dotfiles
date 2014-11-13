(defun build-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root))
    (setq root (expand-file-name (read-directory-name "Project top dir: ")))
    (shell-command (concat "ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f " root "TAGS " root)))
  (message "tags built successfully"))

(defun visit-project-tags (&optional dir)
  (interactive)
  (let ((tags-file (concat (expand-file-name (read-directory-name "Dir: ")) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

;; Para e-tags-select
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

