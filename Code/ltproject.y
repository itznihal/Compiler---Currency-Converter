%{
#include<stdio.h>
#include<stdlib.h>
#define YYERROR_VERBOSE 1
void yyerror(char* err);
%}
%token KEYWORD OPERATION NUMBER WHITESPACE
QUESTION
%%
S : D { printf("\nThese Sentences are Valid. \n\n"); exit(0); }
;
D : A B F
;
F : C K
;
K : C E
;
A : NUMBER WHITESPACE
;
B : KEYWORD WHITESPACE
;
C : OPERATION WHITESPACE
;
E : KEYWORD QUESTION
;
%%
void yyerror(char *err) {
printf("Error: ");
fprintf(stderr, "%s\n", err);
exit(1);
}
int main() {
printf("Enter Sentences :\n");
yyparse();
}
