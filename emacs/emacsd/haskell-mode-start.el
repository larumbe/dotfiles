;; Everything about haskell
;;;
;;; haskell-mode full handbook
;;;	https://github.com/haskell/haskell-mode/wiki#wiki-pages-filter

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;;; Speedbar support
;; (speedbar-add-supported-extension ".hs")

;;; Wouldn't it be better to remove the 'eval-after-load' ?
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
  '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

