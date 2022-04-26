%{
	#include<stdio.h>
	#include<string.h>
%}

%start S
%token N
%left '+''-'
%left '*''/'

%%

S	:	E	{ printf("result=%d\n", $1); }
;

E	:	E '+' E { $$=$1+$3; }
	|	E '-' E { $$=$1-$3; }
	|	E '*' E { $$=$1*$3; }
	|	E '/' E { $$=$1/$3; }
	|	N	{ $$=$1; }

%%

int main() {
	printf("enter expression: ");
	yyparse();
	
	return 0;
}

int yyerror() {
	return 1;
}
