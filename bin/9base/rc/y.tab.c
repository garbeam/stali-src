# define FOR 257
# define IN 258
# define WHILE 259
# define IF 260
# define NOT 261
# define TWIDDLE 262
# define BANG 263
# define SUBSHELL 264
# define SWITCH 265
# define FN 266
# define WORD 267
# define REDIR 268
# define DUP 269
# define PIPE 270
# define SUB 271
# define SIMPLE 272
# define ARGLIST 273
# define WORDS 274
# define BRACE 275
# define PAREN 276
# define PCMD 277
# define PIPEFD 278
# define ANDAND 279
# define OROR 280
# define COUNT 281

# line 13 "syn.y"
#include "rc.h"
#include "fns.h"

# line 16 "syn.y"
typedef union
#ifdef __cplusplus
	YYSTYPE
#endif
{
	struct tree *tree;
} YYSTYPE;

#ifdef __STDC__
#include <stdlib.h>
#include <string.h>
#define	YYCONST	const
#else
#include <malloc.h>
#include <memory.h>
#define	YYCONST
#endif

#if defined(__cplusplus) || defined(__STDC__)

#if defined(__cplusplus) && defined(__EXTERN_C__)
extern "C" {
#endif
#ifndef yyerror
#if defined(__cplusplus)
	void yyerror(YYCONST char *);
#endif
#endif
#ifndef yylex
	int yylex(void);
#endif
	int yyparse(void);
#if defined(__cplusplus) && defined(__EXTERN_C__)
}
#endif

#endif

#define yyclearin yychar = -1
#define yyerrok yyerrflag = 0
extern int yychar;
extern int yyerrflag;
YYSTYPE yylval;
YYSTYPE yyval;
typedef int yytabelem;
#ifndef YYMAXDEPTH
#define YYMAXDEPTH 150
#endif
#if YYMAXDEPTH > 0
int yy_yys[YYMAXDEPTH], *yys = yy_yys;
YYSTYPE yy_yyv[YYMAXDEPTH], *yyv = yy_yyv;
#else	/* user does initial allocation */
int *yys;
YYSTYPE *yyv;
#endif
static int yymaxdepth = YYMAXDEPTH;
# define YYERRCODE 256
static YYCONST yytabelem yyexca[] ={
-1, 0,
	0, 1,
	-2, 18,
-1, 1,
	0, -1,
	-2, 0,
	};
# define YYNPROD 71
# define YYLAST 471
static YYCONST yytabelem yyact[]={

    23,    33,    22,    97,    33,   103,    27,   111,    37,    20,
    31,    32,    23,    92,    22,    17,    88,    69,    27,   110,
    66,     3,    65,   101,    40,     3,    41,    40,    28,    64,
    35,    38,    87,    60,    61,    62,    63,    23,    86,    22,
    42,     5,     2,    27,    98,   109,   113,    34,    83,    23,
    70,    22,    78,    79,    80,    27,    82,    77,    88,    12,
     1,    72,    26,    84,    44,    36,    18,    81,    76,    10,
    58,    68,     4,    13,    26,    23,     4,    22,    67,     0,
     0,    27,     0,     0,     0,     0,     0,     0,     0,    89,
    94,     0,     0,     0,     0,    23,    36,    22,    72,    26,
    93,    27,     0,    99,   100,     0,    90,   104,     0,     0,
     0,    26,     0,     0,     0,     0,     0,     0,     0,     0,
    23,     0,    22,    30,     0,     0,    27,   107,    30,   105,
   112,    91,   108,     0,   114,     0,     0,    26,    17,     0,
     0,    43,    57,    59,    29,     0,     0,     0,     0,    29,
     0,    71,     0,     0,    73,    74,    75,    26,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,    71,
     0,     0,     0,    85,     0,     0,     0,     0,     0,     0,
     0,     0,    26,     0,    17,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,    95,    96,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   106,     0,   102,    46,    47,    48,    49,    50,    51,    52,
    53,    54,    55,    25,    56,    46,    47,    48,    49,    50,
    51,    52,    53,    54,    55,    25,    56,    24,    39,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,    24,
    46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
    25,    56,    46,    47,    48,    49,    50,    51,    52,    53,
    54,    55,    25,    56,    24,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,    24,     0,    46,    47,
    48,    49,    50,    51,    52,    53,    54,    55,    25,    19,
    20,     0,     0,     0,     0,     0,     0,     0,     7,     0,
     8,     6,    24,    11,    14,    15,     9,    16,    25,    19,
    20,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,    24,    46,    47,    48,    49,    50,    51,    52,
    53,    54,    55,    25,    56,    33,     0,     0,     0,     0,
    33,    21,     0,     0,    31,    32,     0,    24,     0,    31,
    32,    45,    45,    45,     0,     0,     0,     0,     0,     0,
     0,    45,     0,     0,    45,    45,    45,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,    45,
     0,     0,     0,    45,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,    45,     0,     0,     0,
     0,    45,    45,     0,     0,     0,     0,     0,     0,    45,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    45,    45,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,    45,
    45 };
static YYCONST yytabelem yypact[]={

    61,-10000000,    18,    85,    61,  -260,   -13,   -14,   -16,    86,
    41,    86,    61,    61,    61,    61,-10000000,    61,   -44,    15,
-10000000,-10000000,    86,    86,    86,-10000000,  -108,-10000000,-10000000,-10000000,
-10000000,    61,    61,    61,-10000000,-10000000,  -260,    86,-10000000,-10000000,
    61,    86,-10000000,   -78,-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,
-10000000,-10000000,-10000000,-10000000,-10000000,-10000000,  -108,   -78,-10000000,   -78,
  -266,  -266,  -266,  -266,    15,  -112,    90,    61,-10000000,    86,
    86,   -78,-10000000,  -268,-10000000,-10000000,-10000000,     3,  -266,  -266,
-10000000,-10000000,    61,    61,   -18,   -36,    61,  -108,    86,    86,
-10000000,   -78,-10000000,-10000000,-10000000,   -78,-10000000,-10000000,-10000000,  -269,
  -269,-10000000,-10000000,-10000000,  -269,-10000000,-10000000,   -22,   -34,    61,
-10000000,-10000000,  -269,    61,  -269 };
static YYCONST yytabelem yypgo[]={

     0,    42,    31,    41,    22,    71,    78,    73,    30,    59,
    20,    69,    66,   131,   361,    64,    29,    60,    56,    48,
    46,    45,    38,    32 };
static YYCONST yytabelem yyr1[]={

     0,    17,    17,     1,     1,     4,     4,     5,     5,     6,
     6,     3,     2,     7,     8,     8,     9,     9,    10,    10,
    18,    10,    19,    10,    20,    10,    21,    10,    22,    10,
    23,    10,    10,    10,    10,    10,    10,    10,    10,    10,
    10,    10,    10,    11,    11,    11,    12,    12,    13,    13,
    13,    14,    14,    14,    14,    14,    14,    14,    14,    15,
    15,    15,    15,    15,    15,    15,    15,    15,    15,    16,
    16 };
static YYCONST yytabelem yyr2[]={

     0,     1,     5,     2,     5,     2,     5,     4,     5,     2,
     4,     7,     7,     7,     1,     5,     5,     2,     1,     5,
     1,     9,     1,     9,     1,    17,     1,    13,     1,     9,
     1,     9,     3,     7,     7,     7,     7,     5,     5,     5,
     5,     7,     5,     2,     5,     5,     2,     7,     3,     2,
     7,     5,    11,     5,     5,     2,     5,     7,     5,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     1,
     5 };
static YYCONST yytabelem yychk[]={

-10000000,   -17,    -1,   -10,    -5,    -3,   260,   257,   259,   265,
   -11,   262,    -9,    -7,   263,   264,   266,   123,   -12,   268,
   269,   -14,    36,    34,   281,   267,    96,    40,    10,    59,
    38,   279,   280,   270,    -1,    -8,    -9,   268,    -2,   261,
    40,    40,    -2,   -13,   -15,   -14,   257,   258,   259,   260,
   261,   262,   263,   264,   265,   266,   268,   -13,    -9,   -13,
   -10,   -10,   -10,   -10,   -16,    -4,   -10,    -6,    -5,    61,
    94,   -13,    -3,   -13,   -13,   -13,    -3,   -16,   -10,   -10,
   -10,    -8,   -18,   -19,    -4,   -13,   -22,   -23,    94,   -16,
    -3,   -13,   125,    10,    -4,   -13,   -13,   271,    41,   -10,
   -10,    41,   258,    41,   -10,    -3,   -13,   -16,   -16,   -21,
    41,    41,   -10,   -20,   -10 };
static YYCONST yytabelem yydef[]={

    -2,    -2,     0,     3,    18,    14,     0,     0,     0,     0,
    32,     0,    18,    18,    18,    18,    69,    18,    43,     0,
    17,    46,     0,     0,     0,    55,     0,    69,     2,     7,
     8,    18,    18,    18,     4,    19,    14,     0,    20,    22,
    18,     0,    28,    30,    48,    49,    59,    60,    61,    62,
    63,    64,    65,    66,    67,    68,     0,    44,    45,    69,
    37,    38,    39,    40,    42,     0,     5,    18,     9,     0,
     0,    16,    58,    51,    53,    54,    56,     0,    34,    35,
    36,    15,    18,    18,     0,     0,    18,     0,     0,    33,
    41,    70,    11,    10,     6,    13,    47,    69,    57,    21,
    23,    12,    69,    26,    29,    31,    50,     0,     0,    18,
    52,    24,    27,    18,    25 };
typedef struct
#ifdef __cplusplus
	yytoktype
#endif
{
#ifdef __cplusplus
const
#endif
char *t_name; int t_val; } yytoktype;
#ifndef YYDEBUG
#	define YYDEBUG	0	/* don't allow debugging */
#endif

#if YYDEBUG

yytoktype yytoks[] =
{
	"FOR",	257,
	"IN",	258,
	"WHILE",	259,
	"IF",	260,
	"NOT",	261,
	"TWIDDLE",	262,
	"BANG",	263,
	"SUBSHELL",	264,
	"SWITCH",	265,
	"FN",	266,
	"WORD",	267,
	"REDIR",	268,
	"DUP",	269,
	"PIPE",	270,
	"SUB",	271,
	"SIMPLE",	272,
	"ARGLIST",	273,
	"WORDS",	274,
	"BRACE",	275,
	"PAREN",	276,
	"PCMD",	277,
	"PIPEFD",	278,
	")",	41,
	"ANDAND",	279,
	"OROR",	280,
	"^",	94,
	"$",	36,
	"COUNT",	281,
	""",	34,
	"-unknown-",	-1	/* ends search */
};

#ifdef __cplusplus
const
#endif
char * yyreds[] =
{
	"-no such reduction-",
	"	"rc : /* empty */",
	"rc : line '\n'",
	"line : cmd",
	"line : cmdsa line",
	"body : cmd",
	"body : cmdsan body",
	"cmdsa : cmd ';'",
	"cmdsa : cmd '&'",
	"cmdsan : cmdsa",
	"cmdsan : cmd '\n'",
	"brace : '{' body '}'",
	"paren : '(' body ')'",
	"assign : first '=' word",
	"epilog : /* empty */",
	"epilog : redir epilog",
	"redir : REDIR word",
	"redir : DUP",
	"cmd : /* empty */",
	"cmd : brace epilog",
	"cmd : IF paren",
	"cmd : IF paren cmd",
	"cmd : IF NOT",
	"cmd : IF NOT cmd",
	"cmd : FOR '(' word IN words ')'",
	"cmd : FOR '(' word IN words ')' cmd",
	"cmd : FOR '(' word ')'",
	"cmd : FOR '(' word ')' cmd",
	"cmd : WHILE paren",
	"cmd : WHILE paren cmd",
	"cmd : SWITCH word",
	"cmd : SWITCH word brace",
	"cmd : simple",
	"cmd : TWIDDLE word words",
	"cmd : cmd ANDAND cmd",
	"cmd : cmd OROR cmd",
	"cmd : cmd PIPE cmd",
	"cmd : redir cmd",
	"cmd : assign cmd",
	"cmd : BANG cmd",
	"cmd : SUBSHELL cmd",
	"cmd : FN words brace",
	"cmd : FN words",
	"simple : first",
	"simple : simple word",
	"simple : simple redir",
	"first : comword",
	"first : first '^' word",
	"word : keyword",
	"word : comword",
	"word : word '^' word",
	"comword : '$' word",
	"comword : '$' word SUB words ')'",
	"comword : '\"' word",
	"comword : COUNT word",
	"comword : WORD",
	"comword : '`' brace",
	"comword : '(' words ')'",
	"comword : REDIR brace",
	"keyword : FOR",
	"keyword : IN",
	"keyword : WHILE",
	"keyword : IF",
	"keyword : NOT",
	"keyword : TWIDDLE",
	"keyword : BANG",
	"keyword : SUBSHELL",
	"keyword : SWITCH",
	"keyword : FN",
	"words : /* empty */",
	"words : words word",
};
#endif /* YYDEBUG */
# line	1 "/tmp/yaccpar"
/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License, Version 1.0 only
 * (the "License").  You may not use this file except in compliance
 * with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 1993 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

/* Copyright (c) 1988 AT&T */
/* All Rights Reserved */

/*	from OpenSolaris "yaccpar	6.18	05/06/08 SMI"	*/

/*
 * Portions Copyright (c) 2005 Gunnar Ritter, Freiburg i. Br., Germany
 *
 * Sccsid @(#)yaccpar	1.5 (gritter) 11/26/05
 */

/*
** Skeleton parser driver for yacc output
*/

/*
** yacc user known macros and defines
*/
#define YYERROR		goto yyerrlab
#define YYACCEPT	return(0)
#define YYABORT		return(1)
#define YYBACKUP( newtoken, newvalue )\
{\
	if ( yychar >= 0 || ( yyr2[ yytmp ] >> 1 ) != 1 )\
	{\
		yyerror( "syntax error - cannot backup" );\
		goto yyerrlab;\
	}\
	yychar = newtoken;\
	yystate = *yyps;\
	yylval = newvalue;\
	goto yynewstate;\
}
#define YYRECOVERING()	(!!yyerrflag)
#define YYNEW(type)	malloc(sizeof(type) * yynewmax)
#define YYCOPY(to, from, type) \
	(type *) memcpy(to, (char *) from, yymaxdepth * sizeof (type))
#define YYENLARGE( from, type) \
	(type *) realloc((char *) from, yynewmax * sizeof(type))
#ifndef YYDEBUG
#	define YYDEBUG	1	/* make debugging available */
#endif

/*
** user known globals
*/
int yydebug;			/* set to 1 to get debugging */

/*
** driver internal defines
*/
#define YYFLAG		(-10000000)

/*
** global variables used by the parser
*/
YYSTYPE *yypv;			/* top of value stack */
int *yyps;			/* top of state stack */

int yystate;			/* current state */
int yytmp;			/* extra var (lasts between blocks) */

int yynerrs;			/* number of errors */
int yyerrflag;			/* error recovery flag */
int yychar;			/* current input token number */



#ifdef YYNMBCHARS
#define YYLEX()		yycvtok(yylex())
/*
** yycvtok - return a token if i is a wchar_t value that exceeds 255.
**	If i<255, i itself is the token.  If i>255 but the neither 
**	of the 30th or 31st bit is on, i is already a token.
*/
#if defined(__STDC__) || defined(__cplusplus)
int yycvtok(int i)
#else
int yycvtok(i) int i;
#endif
{
	int first = 0;
	int last = YYNMBCHARS - 1;
	int mid;
	wchar_t j;

	if(i&0x60000000){/*Must convert to a token. */
		if( yymbchars[last].character < i ){
			return i;/*Giving up*/
		}
		while ((last>=first)&&(first>=0)) {/*Binary search loop*/
			mid = (first+last)/2;
			j = yymbchars[mid].character;
			if( j==i ){/*Found*/ 
				return yymbchars[mid].tvalue;
			}else if( j<i ){
				first = mid + 1;
			}else{
				last = mid -1;
			}
		}
		/*No entry in the table.*/
		return i;/* Giving up.*/
	}else{/* i is already a token. */
		return i;
	}
}
#else/*!YYNMBCHARS*/
#define YYLEX()		yylex()
#endif/*!YYNMBCHARS*/

/*
** yyparse - return 0 if worked, 1 if syntax error not recovered from
*/
#if defined(__STDC__) || defined(__cplusplus)
int yyparse(void)
#else
int yyparse()
#endif
{
	register YYSTYPE *yypvt = 0;	/* top of value stack for $vars */

#if defined(__cplusplus) || defined(lint) || defined(__GNUC__)
/*
	hacks to please C++, lint, and gcc - goto's inside
	switch should never be executed
*/
	static int _yaccpar_lint_hack = -1;
	switch (_yaccpar_lint_hack)
	{
		case 1: goto yyerrlab;
		case 2: goto yynewstate;
	}
#endif

	/*
	** Initialize externals - yyparse may be called more than once
	*/
	yypv = &yyv[-1];
	yyps = &yys[-1];
	yystate = 0;
	yytmp = 0;
	yynerrs = 0;
	yyerrflag = 0;
	yychar = -1;

#if YYMAXDEPTH <= 0
	if (yymaxdepth <= 0)
	{
		if ((yymaxdepth = YYEXPAND(0)) <= 0)
		{
			yyerror("yacc initialization error");
			YYABORT;
		}
	}
#endif

	{
		register YYSTYPE *yy_pv;	/* top of value stack */
		register int *yy_ps;		/* top of state stack */
		register int yy_state;		/* current state */
		register int  yy_n;		/* internal state number info */
	goto yystack;	/* moved from 6 lines above to here to please C++ */

		/*
		** get globals into registers.
		** branch to here only if YYBACKUP was called.
		*/
	yynewstate:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;
		goto yy_newstate;

		/*
		** get globals into registers.
		** either we just started, or we just finished a reduction
		*/
	yystack:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;

		/*
		** top of for (;;) loop while no reductions done
		*/
	yy_stack:
		/*
		** put a state and value onto the stacks
		*/
#if YYDEBUG
		/*
		** if debugging, look up token value in list of value vs.
		** name pairs.  0 and negative (-1) are special values.
		** Note: linear search is used since time is not a real
		** consideration while debugging.
		*/
		if ( yydebug )
		{
			register int yy_i;

			printf( "State %d, token ", yy_state );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ++yy_ps >= &yys[ yymaxdepth ] )	/* room on stack? */
		{
			/*
			** reallocate and recover.  Note that pointers
			** have to be reset, or bad things will happen
			*/
			long yyps_index = (yy_ps - yys);
			long yypv_index = (yy_pv - yyv);
			long yypvt_index = (yypvt - yyv);
			int yynewmax;
#ifdef YYEXPAND
			yynewmax = YYEXPAND(yymaxdepth);
#else
			yynewmax = 2 * yymaxdepth;	/* double table size */
			if (yymaxdepth == YYMAXDEPTH)	/* first time growth */
			{
				char *newyys = (char *)YYNEW(int);
				char *newyyv = (char *)YYNEW(YYSTYPE);
				if (newyys != 0 && newyyv != 0)
				{
					yys = YYCOPY(newyys, yys, int);
					yyv = YYCOPY(newyyv, yyv, YYSTYPE);
				}
				else
					yynewmax = 0;	/* failed */
			}
			else				/* not first time */
			{
				yys = YYENLARGE(yys, int);
				yyv = YYENLARGE(yyv, YYSTYPE);
				if (yys == 0 || yyv == 0)
					yynewmax = 0;	/* failed */
			}
#endif
			if (yynewmax <= yymaxdepth)	/* tables not expanded */
			{
				yyerror( "yacc stack overflow" );
				YYABORT;
			}
			yymaxdepth = yynewmax;

			yy_ps = yys + yyps_index;
			yy_pv = yyv + yypv_index;
			yypvt = yyv + yypvt_index;
		}
		*yy_ps = yy_state;
		*++yy_pv = yyval;

		/*
		** we have a new state - find out what to do
		*/
	yy_newstate:
		if ( ( yy_n = yypact[ yy_state ] ) <= YYFLAG )
			goto yydefault;		/* simple state */
#if YYDEBUG
		/*
		** if debugging, need to mark whether new token grabbed
		*/
		yytmp = yychar < 0;
#endif
		if ( ( yychar < 0 ) && ( ( yychar = YYLEX() ) < 0 ) )
			yychar = 0;		/* reached EOF */
#if YYDEBUG
		if ( yydebug && yytmp )
		{
			register int yy_i;

			printf( "Received token " );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ( ( yy_n += yychar ) < 0 ) || ( yy_n >= YYLAST ) )
			goto yydefault;
		if ( yychk[ yy_n = yyact[ yy_n ] ] == yychar )	/*valid shift*/
		{
			yychar = -1;
			yyval = yylval;
			yy_state = yy_n;
			if ( yyerrflag > 0 )
				yyerrflag--;
			goto yy_stack;
		}

	yydefault:
		if ( ( yy_n = yydef[ yy_state ] ) == -2 )
		{
#if YYDEBUG
			yytmp = yychar < 0;
#endif
			if ( ( yychar < 0 ) && ( ( yychar = YYLEX() ) < 0 ) )
				yychar = 0;		/* reached EOF */
#if YYDEBUG
			if ( yydebug && yytmp )
			{
				register int yy_i;

				printf( "Received token " );
				if ( yychar == 0 )
					printf( "end-of-file\n" );
				else if ( yychar < 0 )
					printf( "-none-\n" );
				else
				{
					for ( yy_i = 0;
						yytoks[yy_i].t_val >= 0;
						yy_i++ )
					{
						if ( yytoks[yy_i].t_val
							== yychar )
						{
							break;
						}
					}
					printf( "%s\n", yytoks[yy_i].t_name );
				}
			}
#endif /* YYDEBUG */
			/*
			** look through exception table
			*/
			{
				register YYCONST int *yyxi = yyexca;

				while ( ( *yyxi != -1 ) ||
					( yyxi[1] != yy_state ) )
				{
					yyxi += 2;
				}
				while ( ( *(yyxi += 2) >= 0 ) &&
					( *yyxi != yychar ) )
					;
				if ( ( yy_n = yyxi[1] ) < 0 )
					YYACCEPT;
			}
		}

		/*
		** check for syntax error
		*/
		if ( yy_n == 0 )	/* have an error */
		{
			/* no worry about speed here! */
			switch ( yyerrflag )
			{
			case 0:		/* new error */
				yyerror( "syntax error" );
				goto skip_init;
			yyerrlab:
				/*
				** get globals into registers.
				** we have a user generated syntax type error
				*/
				yy_pv = yypv;
				yy_ps = yyps;
				yy_state = yystate;
			skip_init:
				yynerrs++;
				/* FALLTHRU */
			case 1:
			case 2:		/* incompletely recovered error */
					/* try again... */
				yyerrflag = 3;
				/*
				** find state where "error" is a legal
				** shift action
				*/
				while ( yy_ps >= yys )
				{
					yy_n = yypact[ *yy_ps ] + YYERRCODE;
					if ( yy_n >= 0 && yy_n < YYLAST &&
						yychk[yyact[yy_n]] == YYERRCODE)					{
						/*
						** simulate shift of "error"
						*/
						yy_state = yyact[ yy_n ];
						goto yy_stack;
					}
					/*
					** current state has no shift on
					** "error", pop stack
					*/
#if YYDEBUG
#	define _POP_ "Error recovery pops state %d, uncovers state %d\n"
					if ( yydebug )
						printf( _POP_, *yy_ps,
							yy_ps[-1] );
#	undef _POP_
#endif
					yy_ps--;
					yy_pv--;
				}
				/*
				** there is no state on stack with "error" as
				** a valid shift.  give up.
				*/
				YYABORT;
			case 3:		/* no shift yet; eat a token */
#if YYDEBUG
				/*
				** if debugging, look up token in list of
				** pairs.  0 and negative shouldn't occur,
				** but since timing doesn't matter when
				** debugging, it doesn't hurt to leave the
				** tests here.
				*/
				if ( yydebug )
				{
					register int yy_i;

					printf( "Error recovery discards " );
					if ( yychar == 0 )
						printf( "token end-of-file\n" );
					else if ( yychar < 0 )
						printf( "token -none-\n" );
					else
					{
						for ( yy_i = 0;
							yytoks[yy_i].t_val >= 0;
							yy_i++ )
						{
							if ( yytoks[yy_i].t_val
								== yychar )
							{
								break;
							}
						}
						printf( "token %s\n",
							yytoks[yy_i].t_name );
					}
				}
#endif /* YYDEBUG */
				if ( yychar == 0 )	/* reached EOF. quit */
					YYABORT;
				yychar = -1;
				goto yy_newstate;
			}
		}/* end if ( yy_n == 0 ) */
		/*
		** reduction by production yy_n
		** put stack tops, etc. so things right after switch
		*/
#if YYDEBUG
		/*
		** if debugging, print the string that is the user's
		** specification of the reduction which is just about
		** to be done.
		*/
		if ( yydebug )
			printf( "Reduce by (%d) \"%s\"\n",
				yy_n, yyreds[ yy_n ] );
#endif
		yytmp = yy_n;			/* value to switch over */
		yypvt = yy_pv;			/* $vars top of value stack */
		/*
		** Look in goto table for next state
		** Sorry about using yy_state here as temporary
		** register variable, but why not, if it works...
		** If yyr2[ yy_n ] doesn't have the low order bit
		** set, then there is no action to be done for
		** this reduction.  So, no saving & unsaving of
		** registers done.  The only difference between the
		** code just after the if and the body of the if is
		** the goto yy_stack in the body.  This way the test
		** can be made before the choice of what to do is needed.
		*/
		{
			/* length of production doubled with extra bit */
			register int yy_len = yyr2[ yy_n ];

			if ( !( yy_len & 01 ) )
			{
				yy_len >>= 1;
				yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
				yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
					*( yy_ps -= yy_len ) + 1;
				if ( yy_state >= YYLAST ||
					yychk[ yy_state =
					yyact[ yy_state ] ] != -yy_n )
				{
					yy_state = yyact[ yypgo[ yy_n ] ];
				}
				goto yy_stack;
			}
			yy_len >>= 1;
			yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
			yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
				*( yy_ps -= yy_len ) + 1;
			if ( yy_state >= YYLAST ||
				yychk[ yy_state = yyact[ yy_state ] ] != -yy_n )
			{
				yy_state = yyact[ yypgo[ yy_n ] ];
			}
		}
					/* save until reenter driver code */
		yystate = yy_state;
		yyps = yy_ps;
		yypv = yy_pv;
	}
	/*
	** code supplied by user is placed in this switch
	*/
	switch( yytmp )
	{
		
case 1:
# line 24 "syn.y"
{ return 1;} break;
case 2:
# line 25 "syn.y"
{return !compile(yypvt[-1].tree);} break;
case 4:
# line 27 "syn.y"
{yyval.tree=tree2(';', yypvt[-1].tree, yypvt[-0].tree);} break;
case 6:
# line 29 "syn.y"
{yyval.tree=tree2(';', yypvt[-1].tree, yypvt[-0].tree);} break;
case 8:
# line 31 "syn.y"
{yyval.tree=tree1('&', yypvt[-1].tree);} break;
case 11:
# line 34 "syn.y"
{yyval.tree=tree1(BRACE, yypvt[-1].tree);} break;
case 12:
# line 35 "syn.y"
{yyval.tree=tree1(PCMD, yypvt[-1].tree);} break;
case 13:
# line 36 "syn.y"
{yyval.tree=tree2('=', yypvt[-2].tree, yypvt[-0].tree);} break;
case 14:
# line 37 "syn.y"
{yyval.tree=0;} break;
case 15:
# line 38 "syn.y"
{yyval.tree=mung2(yypvt[-1].tree, yypvt[-1].tree->child[0], yypvt[-0].tree);} break;
case 16:
# line 39 "syn.y"
{yyval.tree=mung1(yypvt[-1].tree, yypvt[-1].tree->rtype==HERE?heredoc(yypvt[-0].tree):yypvt[-0].tree);} break;
case 18:
# line 41 "syn.y"
{yyval.tree=0;} break;
case 19:
# line 42 "syn.y"
{yyval.tree=epimung(yypvt[-1].tree, yypvt[-0].tree);} break;
case 20:
# line 43 "syn.y"
{skipnl();} break;
case 21:
# line 44 "syn.y"
{yyval.tree=mung2(yypvt[-3].tree, yypvt[-2].tree, yypvt[-0].tree);} break;
case 22:
# line 45 "syn.y"
{skipnl();} break;
case 23:
# line 45 "syn.y"
{yyval.tree=mung1(yypvt[-2].tree, yypvt[-0].tree);} break;
case 24:
# line 46 "syn.y"
{skipnl();} break;
case 25:
# line 55 "syn.y"
{yyval.tree=mung3(yypvt[-7].tree, yypvt[-5].tree, yypvt[-3].tree ? yypvt[-3].tree : tree1(PAREN, yypvt[-3].tree), yypvt[-0].tree);} break;
case 26:
# line 56 "syn.y"
{skipnl();} break;
case 27:
# line 57 "syn.y"
{yyval.tree=mung3(yypvt[-5].tree, yypvt[-3].tree, (struct tree *)0, yypvt[-0].tree);} break;
case 28:
# line 58 "syn.y"
{skipnl();} break;
case 29:
# line 59 "syn.y"
{yyval.tree=mung2(yypvt[-3].tree, yypvt[-2].tree, yypvt[-0].tree);} break;
case 30:
# line 60 "syn.y"
{skipnl();} break;
case 31:
# line 61 "syn.y"
{yyval.tree=tree2(SWITCH, yypvt[-2].tree, yypvt[-0].tree);} break;
case 32:
# line 62 "syn.y"
{yyval.tree=simplemung(yypvt[-0].tree);} break;
case 33:
# line 63 "syn.y"
{yyval.tree=mung2(yypvt[-2].tree, yypvt[-1].tree, yypvt[-0].tree);} break;
case 34:
# line 64 "syn.y"
{yyval.tree=tree2(ANDAND, yypvt[-2].tree, yypvt[-0].tree);} break;
case 35:
# line 65 "syn.y"
{yyval.tree=tree2(OROR, yypvt[-2].tree, yypvt[-0].tree);} break;
case 36:
# line 66 "syn.y"
{yyval.tree=mung2(yypvt[-1].tree, yypvt[-2].tree, yypvt[-0].tree);} break;
case 37:
# line 67 "syn.y"
{yyval.tree=mung2(yypvt[-1].tree, yypvt[-1].tree->child[0], yypvt[-0].tree);} break;
case 38:
# line 68 "syn.y"
{yyval.tree=mung3(yypvt[-1].tree, yypvt[-1].tree->child[0], yypvt[-1].tree->child[1], yypvt[-0].tree);} break;
case 39:
# line 69 "syn.y"
{yyval.tree=mung1(yypvt[-1].tree, yypvt[-0].tree);} break;
case 40:
# line 70 "syn.y"
{yyval.tree=mung1(yypvt[-1].tree, yypvt[-0].tree);} break;
case 41:
# line 71 "syn.y"
{yyval.tree=tree2(FN, yypvt[-1].tree, yypvt[-0].tree);} break;
case 42:
# line 72 "syn.y"
{yyval.tree=tree1(FN, yypvt[-0].tree);} break;
case 44:
# line 74 "syn.y"
{yyval.tree=tree2(ARGLIST, yypvt[-1].tree, yypvt[-0].tree);} break;
case 45:
# line 75 "syn.y"
{yyval.tree=tree2(ARGLIST, yypvt[-1].tree, yypvt[-0].tree);} break;
case 47:
# line 77 "syn.y"
{yyval.tree=tree2('^', yypvt[-2].tree, yypvt[-0].tree);} break;
case 48:
# line 78 "syn.y"
{lastword=1; yypvt[-0].tree->type=WORD;} break;
case 50:
# line 80 "syn.y"
{yyval.tree=tree2('^', yypvt[-2].tree, yypvt[-0].tree);} break;
case 51:
# line 81 "syn.y"
{yyval.tree=tree1('$', yypvt[-0].tree);} break;
case 52:
# line 82 "syn.y"
{yyval.tree=tree2(SUB, yypvt[-3].tree, yypvt[-1].tree);} break;
case 53:
# line 83 "syn.y"
{yyval.tree=tree1('"', yypvt[-0].tree);} break;
case 54:
# line 84 "syn.y"
{yyval.tree=tree1(COUNT, yypvt[-0].tree);} break;
case 56:
# line 86 "syn.y"
{yyval.tree=tree1('`', yypvt[-0].tree);} break;
case 57:
# line 87 "syn.y"
{yyval.tree=tree1(PAREN, yypvt[-1].tree);} break;
case 58:
# line 88 "syn.y"
{yyval.tree=mung1(yypvt[-1].tree, yypvt[-0].tree); yyval.tree->type=PIPEFD;} break;
case 69:
# line 90 "syn.y"
{yyval.tree=(struct tree*)0;} break;
case 70:
# line 91 "syn.y"
{yyval.tree=tree2(WORDS, yypvt[-1].tree, yypvt[-0].tree);} break;
# line	562 "/tmp/yaccpar"
	}
	goto yystack;		/* reset registers in driver code */
}

