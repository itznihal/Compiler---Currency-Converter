%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "y.tab.h";
%}
Keyword "rupiya"|"dollar"|"pound"|"swissfranc"|"euro"|"canadiandollar"|"thiabaht"|"chienceyaun"|"brazalianreal"|"iraqidinar"
Op "na"|"ketla"
Digit [0-9]
Int {Digit}+
qm "?"
ws [ \t\n]
%%
{Keyword} {printf("Keyword - %s\n",yytext);return KEYWORD;}
{Op} {printf("Operator - %s\n",yytext);return OPERATION;}
{Int} {printf("Integer - %s\n",yytext);return NUMBER;}
{qm} {return QUESTION;}
{ws} {return WHITESPACE;}
. {printf("Invalid Token : %s\n",yytext); return *yytext;}
%%
int yywrap()
{return 1;}