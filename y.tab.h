
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     NUM = 259,
     DELETE = 260,
     FROM = 261,
     WHERE = 262,
     LIMIT = 263,
     LE = 264,
     GE = 265,
     EQ = 266,
     NE = 267,
     OR = 268,
     AND = 269,
     GROUP = 270,
     USING = 271,
     HAVING = 272,
     ORDER = 273,
     ASC = 274,
     DESC = 275,
     IN = 276,
     AS = 277,
     SELECT = 278,
     DISTINCT = 279,
     BETWEEN = 280,
     LOW_PRIORITY = 281,
     QUICK = 282,
     IGNORE = 283,
     COUNT = 284
   };
#endif
/* Tokens.  */
#define ID 258
#define NUM 259
#define DELETE 260
#define FROM 261
#define WHERE 262
#define LIMIT 263
#define LE 264
#define GE 265
#define EQ 266
#define NE 267
#define OR 268
#define AND 269
#define GROUP 270
#define USING 271
#define HAVING 272
#define ORDER 273
#define ASC 274
#define DESC 275
#define IN 276
#define AS 277
#define SELECT 278
#define DISTINCT 279
#define BETWEEN 280
#define LOW_PRIORITY 281
#define QUICK 282
#define IGNORE 283
#define COUNT 284




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


