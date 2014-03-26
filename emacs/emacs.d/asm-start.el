;; Everything about ASM modes

;; Settings
(require 'asm-mode)
(define-key asm-mode-map (kbd "C-c C-j") '(lambda () (interactive) (insert "%")))
(define-key asm-mode-map (kbd "C-c C-k") '(lambda () (interactive) (insert "$")))
(define-key asm-mode-map (kbd "C-c C-p") '(lambda () (interactive)
					    (insert "()")()
					    (backward-char)))
(define-key asm-mode-map (kbd "C-,") '(lambda () (interactive) (insert ",")))
(define-key asm-mode-map (kbd ",") '(lambda () (interactive) (insert ", ")))

(define-key asm-mode-map (kbd "C-c C-c") 'compile)
(define-key asm-mode-map (kbd "C-c C-g") 'gdb)

(concat (substring (buffer-name) -1) ".o")


(defun asm-assemble-source ()
  "Simple assembling of asm source code"
  (interactive)
  (let ((base-name (substring (buffer-name) 0 (- (length (buffer-name)) 2))))
    (compile (format "as %s -o %s ; ld %s -o %s"
		     (buffer-name)
		     (concat base-name ".o")
		     (concat base-name ".o")
		     base-name
		     )
	     t)
    )
  )

(define-key asm-mode-map (kbd "C-c C-c") 'asm-assemble-source)

(setq asm-comment-char ?#)

;; Haz esto para tardar menos en ensambladr archivos sencillos
;; (defun assemble ()
;;   "Assemble source file with compile command"
;;   (interactive)
;; )



;; Main source of documentation:
;;	http://asm.sourceforge.net

;; GCC inline assembly gcc handbook
;;
;; Como programar ASM ARM para Samsumg
;; Syscalls in normal programme invocation
;; IO-Port-Programming MiniHOWTO
;; DOSEMU sources
;; Analyzing object files (binultils)
;; Graphics programming svgalib,framebuffer, xlib
;; Bios functions
;; FreeBSD system calls
;; ELF format, linkers and loaders


;; http://asm.sourceforge.net/intro/Assembly-Intro.html
;; http://asm.sourceforge.net/howto/Assembly-HOWTO.html
;; http://docs.cs.up.ac.za/programming/asm/derick_tut/
;; http://heather.cs.ucdavis.edu/~matloff/50/LinuxAssembly.html
;;
;; Kernel source references
;;     arch/i386/kernel/entry.S
;;     include/asm-i386/unistd.h
;;     include/linux/sys.h

;; Professional Linux assembly
;; PC ASsembly language
;; https://en.wikibooks.org/wiki/X86_Assembly
;; Programming the ground up
;; Linux assembly programming

;; Introduction to UNIX assembly programming ( nasm; Linux, *BSD, BeOS )
;; Using Assembly Language in Linux ( AT&T and Intel syntax, gcc inline assembly )
;; Writing A Useful Program With NASM ( nasm )
;; Linux Assembly Tutorial - Step-by-Step Guide ( nasm )
;; FreeBSD Assembly Programming tutorial ( nasm )
;; Inline assembly for x86 in Linux ( gas and gcc inline assembly )
;; Brennan's Guide to Inline Assembly ( gcc inline assembly )
;; Introduction to GCC Inline Asm ( gcc inline assembly )
;; Assembler and X-Windows-Programming ( gas, gcc )
;; A Whirlwind Tutorial on Creating Really Teensy ELF Executables for Linux

;; http://felix.abecassis.me/2012/08/gdb-debugging-stripped-binaries/
