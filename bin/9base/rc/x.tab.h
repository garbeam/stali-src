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

typedef union
#ifdef __cplusplus
	YYSTYPE
#endif
{
	struct tree *tree;
} YYSTYPE;
extern YYSTYPE yylval;
