expr-bison:
	flex expr.lex
	bison -vdty expr.y
	gcc -o expr y.tab.c lex.yy.c

clean:
	rm -f expr y.tab.c y.tab.h lex.yy.c