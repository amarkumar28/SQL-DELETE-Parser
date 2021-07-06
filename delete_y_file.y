%{
#include <stdio.h>
#include <stdlib.h>
void yyerror();
%}

// PROCESSING:The yacc file will parse the tokens as per the grammar that is defined using 17 Production rules. There are no semantic actions because we are just checking the validity. If the query do not start with delete,(since its a parser for delete sql command), it will be rejected or will be declared invalid in the beginning statement itself.

%token ID NUM DELETE FROM WHERE LIMIT
%token LE GE EQ NE OR AND GROUP USING
%token HAVING ORDER ASC DESC IN AS SELECT DISTINCT BETWEEN
%token LOW_PRIORITY QUICK IGNORE COUNT
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE

%%

    S    : ST1';' {printf("\n****************  VALID DELETE STATEMENT  ***************\n");exit(0);};
    ST1    : DELETE delete_options attributeList FROM tableList ST2 ST7    
        | DELETE delete_options FROM tableList ST2 ST7
        | DELETE delete_options FROM attributeList USING tableList ST2 ST7
        ;

	//ST1 calls the production rule delete_options , tableList, attributeListdepending on the structure of entered query and and ST2,ST7 .
    
    ST2    : WHERE CONDITION ST5
        | ST5
        ;

    //ST2 calls production rule CONDITION if the query contains WHERE , and it calls ST5 because group by and having are not allowed in DELETE, else if it doesnt contain WHERE ST5 is directly called
	
    ST3    : GROUP attributeList ST4
        | ST5
        ;
    
    // calls attributeList and then ST4 but if the query doesnt contain GROUPBY, it directly calls ST5 (that comes from the or condition.
    
    ST4    : HAVING COUNT'(' F ')' ST5
        | HAVING COUNT'(' F ')' E1 ST5
        | ST5
        ;
	
    //functions when the query contains having count function.
    
    ST5    : ORDER attributeList ST6
        |
        ;
	
    //it contributes in checking the validity of query when it contains ORDERBY
    
    ST6    : DESC
        | ASC
        |
        ;
	
    // production rule for ascending and descending value passed to ORDERBY and Empty for By default value
    
    ST7    : LIMIT NUM
        |   LIMIT NUM','NUM
        |
        ;
	
    //it checks for validity of the limit number of rows being applied in delete query.
    
    ST8    : SELECT attributeList FROM tableList ST9
        | SELECT DISTINCT attributeList FROM tableList ST9
        ;
	
    // these set of rules are to check the valadity of inner select in the delete query.
    
    ST9    : WHERE CONDITION ST3
        | ST3
        ;
	
    // if inner select in the delete  query contains where condition, this rule functions for its validity check. 
    
    delete_options :     delete_options LOW_PRIORITY
        |   delete_options QUICK
        |   delete_options IGNORE
        |
        ;  
    
    // rule for checking validity of type of delete in the query.		
    
    attributeList :     ID','attributeList
        | '*'
        | ID
        ;
	
    // rule to check whether the attributes to operate delete are named correctly.
    
    tableList    : ID ',' tableList
        | ID
        ;
	
    // rule to check whether the table name is correctlytyoed in query.. it is a valad name or not.
    
    CONDITION    : CONDITION OR CONDITION
        | CONDITION AND CONDITION
        | E
        | ID BETWEEN F AND F
        | ID IN '(' ST8 ')'
        | ID IN '(' F ',' F ')'
        ;
	
    // this rule is to match for different types of conditions that WHERE can be followed by in a query.	
    
    E    : F '=' F 
        | F '<' F
        | F '>' F 
        | F LE F
        | F GE F
        | F EQ F
        | F NE F
        | F OR F
        | F AND F
        ;
    
    E1    : '=' F 
        | '<' F
        | '>' F 
        | LE F
        | GE F
        | EQ F
        | NE F
        | OR F
        | AND F
        ;
    
    F    : ID
        | NUM 
        ;
%%
void main()
{
    printf("Enter the Query: ");
    yyparse();
}       
void yyerror()
{
  printf("\n****************  INVALID STATEMENT  ***************\n\n");
} 