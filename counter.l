%{
int lc, wc;
%}

%%

\n { lc++; }
[^ \n\t]+ { wc++; }

%%

int yywrap(void) {
	return 1;
}

int main(int argc, char* argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	printf("\nnumber of lines=%d\nnumber of words=%d\n\n", lc, wc);
	return 0;
}
