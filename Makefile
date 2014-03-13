FILES:="\"stumpwmrc.org\""
DIR:=$(shell pwd)
ORGINSTALL:=${HOME}/.emacs.src.d/org-mode/lisp/
SHELL:=zsh

tangle:
	@emacs -Q --batch -L ${ORGINSTALL} \
		--eval "(progn \
			(require 'org) (require 'ob) (require 'ob-tangle) \
			 (mapc (lambda (file) (find-file (expand-file-name file \"$(DIR)\")) (org-babel-tangle) (kill-buffer)) '($(FILES))))" 


.PHONY: tangle
