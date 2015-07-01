;; ORG MODE ;;
;;;;;;;;;;;;;;
(require 'org)

;;; Org-wide variables
(setq org-log-done 'time)

;;; Basic keybindings
(define-key org-mode-map (kbd "C-c l") 'org-store-link)
(define-key org-mode-map (kbd "C-c c") 'org-capture)
(define-key org-mode-map (kbd "C-c b") 'org-iswitchb)
(define-key org-mode-map (kbd "C-c .") 'org-priority)
(define-key org-mode-map (kbd "C-c i") 'org-iswitchb)
(define-key org-mode-map (kbd "C-c t") 'org-time-stamp)
(define-key org-mode-map (kbd "C-c f") 'org-metaright)
(define-key org-mode-map (kbd "C-c b") 'org-metaleft)
(define-key org-mode-map (kbd "C-c n") 'org-metadown)
(define-key org-mode-map (kbd "C-c p") 'org-metaup)
(define-key org-mode-map (kbd "C-c '") 'org-insert-todo-heading)
(define-key org-mode-map (kbd "M-p") 'org-table-previous-field)
(define-key org-mode-map (kbd "M-n") 'org-table-next-field)

;;; Global keybindings
(global-set-key (kbd "C-z J") 'org-clock-goto)

;;; Capturing stuff
(setq org-default-notes-file "~/org/remember.org")
;; (define-key global-map (kbd "C-z c") 'org-capture)
;;;	Capture templates
(setq org-capture-templates '(("t" "Todo" entry (file+headline
						 "" "Tasks") "* TODO %?\n %i %T\n %a")
			      ("e" "Emacs" entry (file+headline
						  "" "Emacs") "* TODO %?\n %i %T\n %a")
			      ("p" "Programming" entry (file+headline
						 "" "Programming") "* TODO %?\n %i %T\n %a")
			      ("w" "Work" entry (file+headline
							"" "Work") "* TODO %?\n %i %T\n %a")))

;;; Saving clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;; Agenda stuff
;; (define-key global-map (kbd "C-z a") 'org-agenda)

;;; Mobile Org
(setq org-directory "~/org/")
(setq org-mobile-directory "~/org/MobileOrg/")
(setq org-mobile-inbox-for-pull "~/org/MobileOrg/from-mobile.org")

;;; Opening a new 'orden del dia' entry for today ;;;
(setq archivo-ordendia "~/org/ordendia.org")
;;; ::::::::::::::::::

;;; Daily journal (perhaps you're duplicating functionality)
(defun org-daily-journal ()
  "Adds a new entry to todays' ordendeldia"
  (interactive)
  ;; Open file, go to the end of it
  (let ((date-string (format-time-string "%Y-%m-%d")))
    (find-file archivo-ordendia)
    (unless (search-forward date-string nil t 1)
      (end-of-buffer)
      (newline)
      (insert (concat "* " date-string "\n"))
      (insert "- [ ] Read Hackernews, Meneame, /r/worldnews\n")
      (insert "** Programming\n")
      (insert "- [ ] Teoria: SIOCP, Algorithms + Data Structures, Rosetta Code, Daily Programmer\n") 
      (insert "- [ ] Elisp: Reading code of frequent functions, elisp manual, ELISP Intro final chapter\n") 
      (insert "- [ ] Shell + Perl: Shell manual, modern perl, irssi + urxvt extensions\n") 
      (insert "- [ ] Java: Android apps, android dev manual\n") 
      (insert "- [ ] C,ASM: System software, system tools, drivers, security\n") 
      (insert "- [ ] Python: Dive into python, general software, ED2 projects, compilers\n") 
      (insert "- [ ] Haskell, Maple: Math, discrete math\n") 
      (insert "- [ ] SQL, Javascript, PHP, HTML: Web development\n") 
      )))
;;; GO TO THE BEGINNING OF THE BUFFER IF IT'S ALREADY OPEN


;; (global-set-key (kbd "C-z o") 'ordendia-new-entry)

;;; Common prefix
(define-prefix-command 'org-prefix nil "Tags action: a (agenda), j (journal), c (capture), i(switch)")
(global-set-key (kbd "C-z o") 'org-prefix)
(define-key org-prefix (kbd "a") 'org-agenda)
(define-key org-prefix (kbd "j") 'org-daily-journal)
(define-key org-prefix (kbd "c") 'org-capture)
(define-key org-prefix (kbd "i") 'org-ido-switchb)

;;; Redmine
;;; https://github.com/gtp/emacs-redmine
(defun redmine-my-project ()
  (interactive)
  (setq redmine-program "~/.emacs.d/emacs-redmine/redmine.py")
  (setq redmine-project-name "router-2015")
    (setq redmine-login-key "e626f1935808a89bca1b2a39677e3ec51d12543b")
  ;; (setq redmine-login-key "myuniquekey##XX##XX")
  (setq redmine-url "http://192.168.4.2/redmine")
  (redmine-show-sprints))
