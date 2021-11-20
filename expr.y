%{
#include <stdio.h>
void yyerror(const char* msg) {}
%}

%token T_NUM

%%

S   :   S E '\n'        { printf("ans = %d\n", $2); }
    |   /* empty */     { /* empty */ }
    ;

E   :   E '+' T         { printf("E->E+T\n"); $$ = $1 + $3; }
    |   E '-' T         { printf("E->E-T\n"); $$ = $1 - $3; }
    |   T               { printf("E->T\n"); $$ = $1; }

T   :   T '*' F         { printf("T->T*F\n"); $$ = $1 * $3; }
    |   T '/' F         { printf("T->T/F\n"); $$ = $1 / $3; }
    |   F               { printf("T->F\n"); $$ = $1; }

F   :   T_NUM           { printf("T->num\n"); $$ = $1; }
    |   '(' E ')'       { printf("T->(E)\n"); $$ = $2; }
    ;

%%

int main() {
    return yyparse();
}