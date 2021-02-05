# $Id$
# Makefile for Lions Book
# This file is an afterthought.  It effectively repeats in the correct
# format the instructions in the file Readme
.POSIX:

SRC	=	${TEX}

TEX	=	ch1.tex ch10.tex ch11.tex ch12.tex ch13.tex ch14.tex ch15.tex \
		ch16.tex ch17.tex ch18.tex ch19.tex ch2.tex ch20.tex ch21.tex ch22.tex \
		ch23.tex ch24.tex ch25.tex ch26.tex ch3.tex ch4.tex ch5.tex ch6.tex \
		ch7.tex ch8.tex ch9.tex fig23_1.tex fig23_2.tex fig23_3.tex \
		fig23_4.tex lionc.tex preface.tex title.tex

all:	lionc.pdf

pdf lionc.pdf: lionc.ps
	ps2pdf lionc.ps

lionc.ps: lionc.dvi
	dvips lionc.dvi -o lionc.ps

lionc.dvi: ${SRC}
	latex lionc.tex
	latex lionc.tex


# Construct the directories from wordlist(s)
wordlist: words_en words_names words_persons words_code words_orgs
	cat $^ > $@
.aspell.en.pws: wordlist
	echo 'personal_ws-1.1 en 100' > $@
	cat $^ >> $@

.ispell_english: wordlist
	cat $^ > $@

# Don't call this directly, since suffix rules cannot depend on additional
# prerequisites, like the spellcheck file.
.tex.aspell:
	aspell -d en -p ./.aspell.en.pws -c -t $^

aspell: .aspell.en.pws $(TEX) $(TEX:.tex=.aspell)
ispell: .ispell_english $(TEX)
	ispell -t $^ $(TEX)
spellcheck: aspell ispell

.missspelled_a: .aspell.en.pws $(TEX)
	cat $(TEX) | aspell -t -d en -p ./.aspell.en.pws list | sort -u > $@
.missspelled_da: .aspell.en.pws $(TEX)
	detex lionc.tex | aspell -d en -p ./.aspell.en.pws list | sort -u > $@
.missspelled_i: .ispell_english $(TEX)
	cat $(TEX) | ispell -t -l | sort -u > $@
.missspelled_di: .ispell_english $(TEX)
	detex lionc.tex | ispell -l | sort -u > $@
.missspelled_d: .missspelled_da .missspelled_di
	comm -12 $^ | sort -u > $@
.missspelled_x: .missspelled_i .missspelled_a
	comm -12 $^ | sort -u > $@
missspelled: .missspelled_d .missspelled_x
	comm -12 $^ | sort -u > $@

clean:
	rm -f *.dvi *.ps *.pdf *.toc *.log *.aux

.SUFFIXES:
.SUFFIXES: .tex .aspell
.PHONY: all aspell ispell spellcheck clean
