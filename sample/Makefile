KMYACC = ../src/kmyacc
JAVAC = javac
JAVA = java
PERL = perl

all: calc Calc.class calc.pl calc.html

test: all
	./calc <calc-input >out-c
	$(JAVA) Calc <calc-input >out-java
	perl calc.pl <calc-input >out-perl
	-diff out-c out-java
	-diff out-c out-perl

calc: calc.c
	$(CC) -o calc calc.c

calc.c: calc.y
	$(KMYACC) -m ../src/kmyacc.c.parser calc.y
	mv -f y.tab.c calc.c

Calc.class: Calc.java
	$(JAVAC) Calc.java

Calc.java: Calc.jy ../src/kmyacc.java.parser
	$(KMYACC) -m ../src/kmyacc.java.parser Calc.jy

calc.pl: calc.ply
	$(KMYACC) -m ../src/kmyacc.pl.parser calc.ply

calc.html: calc.jsy
	$(KMYACC) -m ../src/kmyacc.js.parser calc.jsy
	mv -f calc.js calc.html

calc_odin: calc.odin
	odin build calc.odin -file -out:calc_odin

calc.odin: calc.odiny ../src/kmyacc.odin.parser
	$(KMYACC) -m ../src/kmyacc.odin.parser calc.odiny

calc_push_odin: calc_push.odin
	odin build calc_push.odin -file -out:calc_push_odin

calc_push.odin: calc_push.odiny ../src/kmyacc.odin.push.parser
	$(KMYACC) -m ../src/kmyacc.odin.push.parser calc_push.odiny

clean:
	rm -f *~ calc.c Calc.java calc.pl *.class calc calc.html calc.odin calc_odin calc_push.odin calc_push_odin out-*

