%option noyywrap
%{
    #include "y.tab.h"
	/*
	INPUT:-It takes a sql delete query and checks wether it is correct or not.
	PROCESS:-The lex file will extract the tokens defined in it i.e., NEWLINE,TAB, delete,select,distinct,low_priority,quick,ignore,limit,from,count,between,where
	desc,using,as,asc,group,having,order,or,and,in,num,ID,LE,GE,EQ,NE,and everything else is sent as well and do not contribute to the language and if encountered
	will be rejected right away.
	*/
%}
alpha [_A-Za-z]
digit [0-9]
%%
[ \t\n]
[D|d][E|e][L|l][E|e][T|t][E|e]           return DELETE;
[S|s][E|e][L|l][E|e][C|c][T|t]           return SELECT;
[D|d][i|I][s|S][T|t][I|i][N|n][c|C][t|T] return DISTINCT;
[L|l][I|i][M|m][I|i][T|t]                return LIMIT;
[F|f][R|r][O|o][M|m]                     return FROM;
[C|c][O|o][U|u][N|n][T|t]                return COUNT;
[B|b][E|e][T|t][W|w][E|e][E|e][N|n]      return BETWEEN;
[W|w][H|h][E|e][R|r][E|e]                return WHERE;
[D|d][E|e][S|s][C|c]                     return DESC;
[U|u][S|s][I|i][N|n][G|g]                return USING;
[A|a][S|s]                               return AS;
[A|a][S|s][C|c]                          return ASC;
[G|g][R|r][O|o][U|u][P|p][ ][B|b][Y|y]   return GROUP;
[H|h][A|a][V|v][I|i][N|n][G|g]           return HAVING;
[O|o][R|r][D|d][E|e][R|r][ ][B|b][Y|y]   return ORDER;
[O|o][R|r]                               return OR;
[A|a][N|n][D|d]                          return AND; 
[I|i][N|n]                               return IN;
LOW_PRIORITY                             return LOW_PRIORITY;
QUICK                                    return QUICK;
IGNORE                                   return IGNORE;
{digit}+                                 return NUM;
{alpha}({alpha}|{digit})*                return ID;
\'{alpha}({alpha}|{digit})*\'            return ID;
"<="                                     return LE;
">="                                     return GE;
"=="                                     return EQ;
"<>"|"!="                                return NE;
.                                        return yytext[0];
%%
