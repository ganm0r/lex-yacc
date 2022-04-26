%{

int counter = 0;

%}


%%

[ \n\t]+ ;
"public"|"class"|"static"|"void"|"int"|"String"|"if"|"else" { counter++; printf("%d\t%s\t keyword\n", counter, yytext); }
"}"|"{"|"("|")"|"["|"]" { counter++; printf("%d\t%s\t paranthesis\n", counter, yytext); }
[a-zA-Z] { counter++; printf("%d\t%s\t identifier\n", counter, yytext); }
[0-9]+ { counter++; printf("%d\t%s\t number\n", counter, yytext); }
"+"|"-"|"*"|"/"|"="|";"|"!"|"," { counter++; printf("%d\t%s\t operator\n", counter, yytext); }

%%

int yywrap() {
	return 1;
}

int main(int argc, char* argv[]) {
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}
