
/* Prototype file of Odin push parser.
 * This file is PUBLIC DOMAIN.
 */

package main

import "core:fmt"


import "core:os"

YYSTYPE :: int

YYMAXDEPTH :: 512

YYPUSH_MORE :: 4

YYERRTOK :: 256
keyword_if :: 257
keyword_else :: 258
keyword_case :: 259
keyword_emit :: 260
keyword_skip :: 261
keyword_return :: 262
keyword_namespace :: 263
keyword_class :: 264
keyword_import :: 265
keyword_def :: 266
keyword_method :: 267
keyword_new :: 268
keyword_nil :: 269
keyword_true :: 270
keyword_false :: 271
op_lasgn :: 272
op_rasgn :: 273
op_lambda :: 274
op_lambda2 :: 275
op_lambda3 :: 276
op_plus :: 277
op_minus :: 278
op_mult :: 279
op_div :: 280
op_mod :: 281
op_eq :: 282
op_neq :: 283
op_lt :: 284
op_le :: 285
op_gt :: 286
op_ge :: 287
op_and :: 288
op_or :: 289
op_bar :: 290
op_amper :: 291
op_colon2 :: 292
lit_time :: 293
lit_number :: 294
lit_symbol :: 295
lit_string :: 296
identifier :: 297
label :: 298
op_LOWEST :: 299
op_HIGHEST :: 300

yydebug : bool = false


yytranslate := [?]i16{
        0,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       55,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   42,   56,   56,   56,   56,   56,   56,
       46,   47,   56,   56,   49,   56,   52,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   54,
       56,   48,   56,   56,   53,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   50,   56,   51,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   44,   56,   45,   43,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
       56,   56,   56,   56,   56,   56,    1,    2,    3,    4,
        5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
       15,   16,   56,   17,   18,   19,   20,   21,   22,   23,
       24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
       34,   35,   56,   36,   37,   38,   39,   40,   41,   56,
       56
    }

YYBADCH :: 56
YYMAXLEX :: 301
YYTERMS :: 56
YYNONTERMS :: 31

yyaction := [?]i16{
      125,-32767,-32767,-32766,-32766,-32766,-32766,-32766,-32766,-32766,
    -32766,  131,  241,  242,  243,   34,   35,   36,    0,   24,
       25,   16,  192,   17,  128,  129,  130,  104,  105,-32766,
    -32766,-32766,   51,  106,  235,  232,  234,  108,  109,   11,
       26,   27,    5,   53,   23,  145,   74,  126,   15,   32,
       33,   34,   35,   36,   37,   38,   39,   40,   41,   42,
       43,   44,   45,   46,   49,   73,   16,  192,   17, -120,
      295,  296,  104,  256,  257,  258, -120, -120,   84,  285,
      275,   52,   83,   16,  192,   17,   30,  283,  259,  104,
      154,   84,   30,   86,-32766,-32766,  254,  277,  255,  196,
     -120,  260,  276,   84,   31,  286, -120,    9,   12,   75,
       31,   87,   54,  278,  239,  295,  296,  -28,  -29,  -28,
      -29,  120,   85,   48,   50,    8,-32766,   32,   33,  198,
      197,-32766,  295,  296,  295,  296,  137,    5,  139,  176,
      178,  263,   79,  262,  136,    0,    0,  196,    0,    0,
        0,    0,    2,    1,    0,  281,  177,  179,  284,  219,
      282,  188,    0,   20,   18,   21,  121,   28,    0,  222,
      122,  123,  237,  117,  124,  118,    0,   47,    0,  116,
      127,   88,   82,   81,   80,   22,    0,   19,    0,  261,
      244,  238,    0,   93,    0,  156
    }

YYLAST :: 196

yycheck := [?]i16{
        2,   26,   27,   32,   33,   34,   35,   32,   33,   34,
       35,   13,   14,   15,   16,   23,   24,   25,    0,   21,
       22,    5,    6,    7,    8,    9,   10,   11,   12,   33,
       34,   35,    3,   35,   36,   37,   38,   39,   40,   44,
       42,   43,   44,   48,   46,    3,    4,   17,   50,   21,
       22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
       32,   33,   34,   35,    2,    4,    5,    6,    7,   18,
       54,   55,   11,   14,   15,   16,   19,   20,   41,   18,
       18,    2,   23,    5,    6,    7,   23,   45,   51,   11,
       53,   41,   23,   23,   34,   35,   37,   18,   39,   40,
       49,   51,   18,   41,   41,   18,   49,   18,   44,   50,
       41,   41,   48,   18,   51,   54,   55,   44,   44,   46,
       46,   46,   23,   48,   19,   20,   23,   21,   22,   39,
       40,   34,   54,   55,   54,   55,   40,   44,   40,   45,
       40,   40,   40,   51,   40,   -1,   -1,   40,   -1,   -1,
       -1,   -1,   44,   44,   -1,   45,   45,   45,   45,   45,
       45,   45,   -1,   46,   46,   46,   46,   46,   -1,   47,
       47,   47,   47,   47,   47,   47,   -1,   48,   -1,   49,
       49,   49,   49,   49,   49,   49,   -1,   50,   -1,   51,
       51,   51,   -1,   52,   -1,   53
    }

yybase := [?]i16{
       16,   16,   16,   16,   16,   61,   78,   78,   78,   78,
       78,   78,   78,   78,   78,   63,   69,   69,   69,   69,
       69,   69,   69,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
       -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
       -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
       -2,   -2,   -2,   -2,   -2,   29,   30,  125,  122,   84,
       95,   28,   28,   28,   28,   28,   28,   28,   28,   28,
       97,   60,   -4,   62,   62,   37,  -25,  -25,  -29,   50,
       99,  103,  103,  103,  103,  103,  103,  103,  103,  106,
      106,  106,  106,  117,   51,   42,   57,   -8,   -8,   80,
       80,   80,   80,  119,   90,   90,   90,  118,   74,   73,
       75,   87,  105,  140,   79,  134,   70,   -5,   64,  133,
      107,  107,   93,   93,   93,  121,  107,  107,  104,   96,
      100,   98,   18,  129,  141,  136,  109,  108,  120,  137,
      110,  131,  142,  135,  130,   89,  115,  123,   94,  111,
      126,  128,  139,  142,  102,  138,  101,  114,  124,  142,
      113,  127,  132,   92,  142,  142,  116,  112,  132,   -2,
       -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
       -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,   -2,
       -2,   -2,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,   28,   28,   28,   28,   28,   28,
        0,    0,    0,    0,    0,    0,    0,    0,    0,   28,
       28,   28,   59,   59,   59,   28,   28,   28,   59,   59,
       59,   59,   59,   59,   59,   59,   59,   59,   -8,   -8,
       -8,   -8,   90,  129,    0,    0,    0,    0,    0,    0,
        0,    0,   93,    0,    0,    0,   93,    0,    0,    0,
      131,    0,  136,    0,  142,    0,    0,    0,  142
    }

YY2TBLSTATE :: 120

yydefault := [?]i16{
      122,  122,  122,  123,  123,  122,  122,  122,  122,  122,
      122,  122,  122,  123,  123,32767,   56,   56,   56,   56,
       56,   56,32767,  118,32767,32767,32767,32767,32767,32767,
    32767,32767,32767,32767,32767,32767,32767,32767,32767,32767,
    32767,32767,32767,32767,32767,32767,32767,32767,32767,32767,
    32767,32767,32767,32767,32767,   54,   26,32767,32767,32767,
    32767,   58,   60,   59,   18,   21,   49,   55,   20,   11,
       35,   36,   48,32767,32767,32767,   41,   42,   47,32767,
    32767,32767,32767,32767,32767,32767,32767,32767,32767,   39,
       40,   37,   38,32767,   67,32767,   67,   30,   31,  122,
      122,  122,  122,   82,32767,32767,32767,32767,   64,   27,
    32767,32767,32767,32767,32767,  102,32767,32767,32767,  100,
      118,  118,   82,   82,   82,32767,32767,32767,32767,32767,
    32767,32767,32767,   67,   52,   57,32767,32767,32767,32767,
    32767,  119,   95,   99,  104,32767,32767,32767,32767,32767,
    32767,32767,32767,   97,32767,32767,32767,32767,32767,   96,
    32767,32767,  103,32767,  105,   98,32767,32767,  101
    }

yygoto := [?]i16{
       61,   61,   61,   61,   61,   61,   61,   61,   57,  212,
      213,  214,  215,   58,   55,   62,   63,   97,   98,  201,
      202,  203,   76,   77,   89,   90,   91,   92,   78,   72,
       70,   71,   64,   65,   59,   66,   67,   60,   68,   69,
      133,  133,  133,  133,  133,   94,  133,  133,  133,  133,
      133,  133,  133,  133,  133,    3,    3,    3,  194,  147,
      152,  158,  161,   96,  246,  249,  247,  148,  149,  173,
      173,  173,  159,  150,  151,  115,  153,  119,  164,  165,
      159,  146,  279,  157,  160,  280,  166,  167,  181,  181,
      181,  181,  181,  101,  103,  175,  155,  252,  294,  294,
      163,  245,  186,  162,  168,  110,  138,  250,  294,  294,
      111,  102,  113,  253,  253,  253,  252,  252,  252,  253,
      253,  253,  253,  253,  253,  253,  253,  253,  253,  231,
       10,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,    4,   14,    4,   14,    0,    0,
      289,  289,    0,    0,    0,    0,  191,  290,  171,  182,
      172,  183
    }

YYGLAST :: 172

yygcheck := [?]i16{
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
       13,   13,   13,   13,   13,    5,    5,    5,   14,   14,
       14,   14,   14,   13,   21,   21,   21,    2,    2,    4,
        4,    4,   22,    8,    8,   22,   22,   22,   22,   22,
       22,    9,    9,    9,    9,    9,    9,    9,   11,   11,
       11,   11,   11,    3,    7,    6,   23,   20,   30,   30,
       23,   20,   11,   24,   24,    7,    7,    7,   30,   30,
       29,   12,   18,   13,   13,   13,   20,   20,   20,   13,
       13,   13,   13,   13,   13,   13,   13,   13,   13,   19,
       26,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
       -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
       -1,   -1,   -1,   -1,    5,    5,    5,    5,   -1,   -1,
       13,   13,   -1,   -1,   -1,   -1,   13,   13,    4,    4,
        4,    4
    }

yygbase := [?]i16{
        0,    0,   66,   90,   69,   55,   91,    1,  -47,   75,
      -15,   88,   98,   40,   41,    0,    0,    0,   97,  107,
       -6,  -58,   -8,   21,   22,    0,   56,    0,    0,  105,
       95
    }

yygdefault := [?]i16{
    -32768,  132,  170,   99,  184,   13,  174,  107,  112,  140,
       56,  185,  100,  236,  193,   29,  220,  134,  135,  230,
      240,  248,  142,  114,  143,  144,    7,   95,    6,  141,
      293
    }

yylhs := [?]i16{
        0,    1,    2,    2,    2,    3,    3,    6,    6,    6,
        6,    6,    6,    9,    9,    9,   12,   12,   11,   11,
       11,   11,   11,   11,   11,   11,   11,   13,    7,    7,
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
       10,   10,   10,   15,   16,   16,   14,   14,   19,   19,
       19,   18,   18,   17,   17,   17,   17,   17,   17,   17,
       17,   17,   17,   17,   17,   17,   17,   17,   17,   17,
       17,   17,   21,   21,   22,   22,   22,   22,   22,   22,
       22,   22,   22,   22,   22,   24,   24,   25,   25,   23,
       23,   23,   23,   23,   23,   23,   26,   26,   26,   26,
       27,   27,   20,   20,   20,   20,   28,   28,    8,    8,
       29,   29,    4,    4,    5,    5,   30,   30
    }

yylen := [?]i16{
        1,    1,    2,    3,    1,    1,    3,    5,    5,    2,
        8,    7,    1,    2,    3,    1,    1,    3,    3,    8,
        7,    4,    3,    1,    2,    2,    1,    1,    1,    1,
        3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
        3,    3,    3,    2,    2,    2,    2,    3,    3,    4,
        5,    4,    1,    3,    0,    2,    0,    1,    1,    2,
        2,    1,    3,    1,    1,    1,    1,    1,    3,    3,
        2,    1,    1,    1,    1,    5,    2,    5,    7,    4,
        6,    2,    0,    1,    1,    1,    1,    1,    1,    1,
        2,    4,    3,    5,    3,    1,    3,    2,    4,    1,
        4,    6,    2,    4,    1,    4,    1,    3,    2,    4,
        3,    4,    3,    4,    3,    6,    1,    2,    0,    1,
        1,    3,    0,    1,    1,    2,    1,    1
    }

YYSTATES :: 253
YYNLSTATES :: 169
YYINTERRTOK :: 1
YYUNEXPECTED :: 32767
YYDEFAULT :: -32766

yyerror : proc(msg: string) = nil

YYParseContext :: struct {
    yystate:   int,
    yychar:    int,
    yysp:      int,
    yyerrflag: int,
    yyval:     YYSTYPE,
    yylval:    YYSTYPE,
    yysstk:    [YYMAXDEPTH]i16,
    yyastk:    [YYMAXDEPTH]YYSTYPE,
}

/*
 * Find (state, ch) in action table.
 * Returns action value, or YYDEFAULT if not found.
 */
@(private="file")
yy_find_in_action :: proc(yystate: int, ch: int) -> (int, bool) {
    yyn := int(yybase[yystate]) + ch
    if yyn >= 0 && yyn < YYLAST && int(yycheck[yyn]) == ch {
        return yyn, true
    }
    if yystate < YY2TBLSTATE {
        yyn = int(yybase[yystate + YYNLSTATES]) + ch
        if yyn >= 0 && yyn < YYLAST && int(yycheck[yyn]) == ch {
            return yyn, true
        }
    }
    return 0, false
}

/*
 * Initialize push parser context
 */
yyparse_init :: proc(ctx: ^YYParseContext) {
    ctx.yystate = 0
    ctx.yychar = -1
    ctx.yysp = 0
    ctx.yyerrflag = 0
    ctx.yysstk[0] = 0
}

/*
 * Push a token to the parser.
 * Returns: YYPUSH_MORE = need more tokens, 0 = accept, 1 = error
 */
yyparse_push :: proc(ctx: ^YYParseContext, token: int, value: YYSTYPE) -> int {
    yyn : int = ---
    yyl : int = ---
    yyp : int = ---

    /* Translate the token */
    ctx.yylval = value
    if token <= 0 {
        ctx.yychar = 0
    } else if token < YYMAXLEX {
        ctx.yychar = int(yytranslate[token])
    } else {
        ctx.yychar = YYBADCH
    }

    for {
        if yybase[ctx.yystate] == 0 {
            yyn = int(yydefault[ctx.yystate])
        } else {
            if ctx.yychar < 0 {
                return YYPUSH_MORE
            }
            action_idx, found := yy_find_in_action(ctx.yystate, ctx.yychar)
            if found {
                yyn = int(yyaction[action_idx])
            } else {
                yyn = YYDEFAULT
            }
            if found && yyn != YYDEFAULT {
                /*
                 * >= YYNLSTATE: shift and reduce
                 * > 0: shift
                 * = 0: accept
                 * < 0: reduce
                 * = -YYUNEXPECTED: error
                 */
                if yyn > 0 {
                    /* shift */
                    if ctx.yysp + 1 >= YYMAXDEPTH {
                        if yyerror != nil { yyerror("parser stack overflow") }
                        return 1
                    }
                    ctx.yysp += 1

                    ctx.yystate = yyn
                    ctx.yysstk[ctx.yysp] = i16(ctx.yystate)
                    ctx.yyastk[ctx.yysp] = ctx.yylval
                    ctx.yychar = -1

                    if ctx.yyerrflag > 0 {
                        ctx.yyerrflag -= 1
                    }
                    if yyn < YYNLSTATES {
                        return YYPUSH_MORE
                    }

                    /* yyn >= YYNLSTATES means shift-and-reduce */
                    yyn -= YYNLSTATES
                } else {
                    yyn = -yyn
                }
            } else {
                yyn = int(yydefault[ctx.yystate])
            }
        }

        for {
            /* reduce/error */
            if yyn == 0 {
                /* accept */
                return 0
            } else if yyn != YYUNEXPECTED {
                /* reduce */
                yyl = int(yylen[yyn])
                ctx.yyval = ctx.yyastk[ctx.yysp - yyl + 1]
                /* Following line will be replaced by reduce actions */
                switch yyn {
                case 125:
{ ctx.yyerrflag = 0; }
                case 126:
{ ctx.yyerrflag = 0; }
                }
                /* Goto - shift nonterminal */
                ctx.yysp -= yyl
                yyn = int(yylhs[yyn])
                yyp = int(yygbase[yyn]) + int(ctx.yysstk[ctx.yysp])
                if yyp >= 0 && yyp < YYGLAST && int(yygcheck[yyp]) == yyn {
                    ctx.yystate = int(yygoto[yyp])
                } else {
                    ctx.yystate = int(yygdefault[yyn])
                }

                if ctx.yysp + 1 >= YYMAXDEPTH {
                    if yyerror != nil { yyerror("parser stack overflow") }
                    return 1
                }
                ctx.yysp += 1

                ctx.yysstk[ctx.yysp] = i16(ctx.yystate)
                ctx.yyastk[ctx.yysp] = ctx.yyval
            } else {
                /* error */
                switch ctx.yyerrflag {
                case 0:
                    if yyerror != nil { yyerror("syntax error") }
                    fallthrough
                case 1, 2:
                    ctx.yyerrflag = 3
                    /* Pop until error-expecting state uncovered */

                    for {
                        err_idx, err_found := yy_find_in_action(ctx.yystate, YYINTERRTOK)
                        if err_found {
                            yyn = int(yyaction[err_idx])
                            break
                        }
                        if ctx.yysp <= 0 {
                            return 1
                        }
                        ctx.yysp -= 1
                        ctx.yystate = int(ctx.yysstk[ctx.yysp])
                    }
                    if ctx.yysp + 1 >= YYMAXDEPTH {
                        if yyerror != nil { yyerror("parser stack overflow") }
                        return 1
                    }
                    ctx.yysp += 1
                    ctx.yystate = yyn
                    ctx.yysstk[ctx.yysp] = i16(ctx.yystate)
                    ctx.yyastk[ctx.yysp] = 0  /* clear error token value */

                case 3:
                    if ctx.yychar == 0 {
                        return 1
                    }
                    ctx.yychar = -1
                    return YYPUSH_MORE
                }
            }

            if ctx.yystate < YYNLSTATES {
                break
            }
            /* >= YYNLSTATES means shift-and-reduce */
            yyn = ctx.yystate - YYNLSTATES
        }
    }
}


/* ============================================================
 * Lexer implementation
 * ============================================================ */

input_data : []u8
input_pos : int = 0
lineno : int = 1
last_token : int = 0
debug_lexer : bool = false

peek_char :: proc() -> int {
    if input_pos >= len(input_data) {
        return -1
    }
    return int(input_data[input_pos])
}

read_char :: proc() -> int {
    if input_pos >= len(input_data) {
        return -1
    }
    c := int(input_data[input_pos])
    input_pos += 1
    if c == '\n' {
        lineno += 1
    }
    return c
}

unread_char :: proc(c: int) {
    if c >= 0 {
        input_pos -= 1
        if c == '\n' {
            lineno -= 1
        }
    }
}

is_alpha :: proc(c: int) -> bool {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_'
}

is_digit :: proc(c: int) -> bool {
    return c >= '0' && c <= '9'
}

is_alnum :: proc(c: int) -> bool {
    return is_alpha(c) || is_digit(c)
}

is_space :: proc(c: int) -> bool {
    return c == ' ' || c == '\t' || c == '\r'
}

/* Skip a comment from # to end of line (do NOT consume the newline) */
skip_comment :: proc() {
    for {
        c := peek_char()
        if c < 0 || c == '\n' {
            return
        }
        read_char()
    }
}

/* Skip trailing whitespace/comments/newlines after certain tokens (TRAIL pattern from lex.l) */
skip_trail :: proc() {
    for {
        c := peek_char()
        if c == ' ' || c == '\t' || c == '\r' {
            read_char()
        } else if c == '#' {
            skip_comment()
        } else if c == '\n' {
            read_char()
        } else {
            return
        }
    }
}

/* Skip leading whitespace/comments/newlines before certain tokens */
skip_leading_trail :: proc() {
    skip_trail()
}

/* Check if newline should be significant based on last_token */
newline_is_significant :: proc() -> bool {
    switch last_token {
    case identifier, lit_number, lit_string, lit_symbol, lit_time,
         ')', ']', '}',
         keyword_nil, keyword_true, keyword_false,
         keyword_skip, keyword_emit, keyword_return:
        return true
    }
    return false
}

/* Check if the next non-whitespace token suppresses newline */
next_suppresses_newline :: proc() -> bool {
    saved_pos := input_pos
    saved_line := lineno
    /* skip spaces and tabs only (not newlines) */
    for {
        c := peek_char()
        if c == ' ' || c == '\t' || c == '\r' {
            read_char()
        } else if c == '#' {
            skip_comment()
        } else if c == '\n' {
            read_char()
        } else {
            break
        }
    }
    /* Check what the next real character is */
    result := false
    c := peek_char()
    if c == '.' {
        result = true
    } else if c == '|' {
        /* check it's op_bar not || */
        next_pos := input_pos + 1
        if next_pos < len(input_data) && input_data[next_pos] == '|' {
            result = false
        } else {
            result = true
        }
    } else if is_alpha(c) {
        /* check if it's 'else' keyword */
        start := input_pos
        for input_pos < len(input_data) && is_alnum(int(input_data[input_pos])) {
            input_pos += 1
        }
        word := string(input_data[start:input_pos])
        if word == "else" {
            result = true
        }
        /* restore */
    }
    /* Restore position */
    input_pos = saved_pos
    lineno = saved_line
    return result
}

read_string :: proc(quote: int) -> bool {
    for {
        c := read_char()
        if c < 0 {
            return false
        }
        if c == '\\' {
            c2 := read_char()
            if c2 < 0 {
                return false
            }
            /* skip escaped char */
        } else if c == quote {
            return true
        }
    }
}

read_number :: proc(first: int) {
    c := first
    if c == '0' {
        c2 := peek_char()
        if c2 == 'x' || c2 == 'X' {
            read_char()
            for {
                c3 := peek_char()
                if (c3 >= '0' && c3 <= '9') || (c3 >= 'a' && c3 <= 'f') || (c3 >= 'A' && c3 <= 'F') {
                    read_char()
                } else {
                    break
                }
            }
            return
        } else if c2 == 'o' || c2 == 'O' {
            read_char()
            for {
                c3 := peek_char()
                if c3 >= '0' && c3 <= '7' {
                    read_char()
                } else {
                    break
                }
            }
            return
        } else if c2 == 'b' || c2 == 'B' {
            read_char()
            for {
                c3 := peek_char()
                if c3 == '0' || c3 == '1' {
                    read_char()
                } else {
                    break
                }
            }
            return
        }
    }
    /* decimal */
    for {
        c2 := peek_char()
        if is_digit(c2) {
            read_char()
        } else {
            break
        }
    }
    /* fractional part */
    if peek_char() == '.' {
        next := input_pos + 1
        if next < len(input_data) && is_digit(int(input_data[next])) {
            read_char() /* consume '.' */
            for {
                c2 := peek_char()
                if is_digit(c2) {
                    read_char()
                } else {
                    break
                }
            }
        }
    }
    /* exponent */
    c2 := peek_char()
    if c2 == 'e' || c2 == 'E' {
        read_char()
        c3 := peek_char()
        if c3 == '+' || c3 == '-' {
            read_char()
        }
        for {
            c4 := peek_char()
            if is_digit(c4) {
                read_char()
            } else {
                break
            }
        }
    }
}

read_ident :: proc() -> string {
    start := input_pos - 1  /* we already consumed the first char */
    for {
        c := peek_char()
        if is_alnum(c) {
            read_char()
        } else if c >= 0x80 {
            /* UTF-8 multibyte - consume */
            read_char()
        } else {
            break
        }
    }
    return string(input_data[start:input_pos])
}

check_keyword :: proc(word: string) -> int {
    switch word {
    case "if":        return keyword_if
    case "else":      return keyword_else
    case "case":      return keyword_case
    case "emit":      return keyword_emit
    case "skip":      return keyword_skip
    case "return":    return keyword_return
    case "namespace": return keyword_namespace
    case "class":     return keyword_class
    case "import":    return keyword_import
    case "def":       return keyword_def
    case "method":    return keyword_method
    case "new":       return keyword_new
    case "nil":       return keyword_nil
    case "true":      return keyword_true
    case "false":     return keyword_false
    }
    return 0
}

/* Apply TRAIL: skip trailing whitespace/comments/newlines */
trail_after :: proc(tok: int) {
    skip_trail()
}

/* Apply leading + trailing trail */
leading_trail_after :: proc(tok: int) {
    skip_leading_trail()
}

streem_yylex :: proc() -> (int, YYSTYPE) {
    for {
        c := read_char()
        if c < 0 {
            if debug_lexer { fmt.eprintln("LEX: EOF") }
            return 0, 0
        }

        /* skip whitespace (not newlines) */
        if c == ' ' || c == '\t' || c == '\r' {
            continue
        }

        /* comment */
        if c == '#' {
            skip_comment()
            continue
        }

        /* newline handling */
        if c == '\n' {
            if newline_is_significant() {
                if !next_suppresses_newline() {
                    last_token = '\n'
                    if debug_lexer { fmt.eprintln("LEX: '\\n'") }
                    return '\n', 0
                }
            }
            continue
        }

        /* string */
        if c == '"' {
            read_string('"')
            last_token = lit_string
            trail_after(lit_string)
            if debug_lexer { fmt.eprintln("LEX: lit_string") }
            return lit_string, 0
        }

        /* number */
        if is_digit(c) {
            read_number(c)
            last_token = lit_number
            if debug_lexer { fmt.eprintln("LEX: lit_number") }
            return lit_number, 0
        }

        /* time literal: digit followed by letters (like 10s, 5min) */
        /* Actually time literals start with digits and were handled above */

        /* identifier / keyword */
        if is_alpha(c) {
            word := read_ident()
            kw := check_keyword(word)
            if kw != 0 {
                last_token = kw
                /* Some keywords need trail */
                switch kw {
                case keyword_case, keyword_skip:
                    trail_after(kw)
                case keyword_else:
                    leading_trail_after(kw)
                }
                if debug_lexer { fmt.eprintf("LEX: keyword %s\n", word) }
                return kw, 0
            }
            /* check if followed by ':' (but not '::') -> label */
            if peek_char() == ':' {
                next := input_pos + 1
                if next >= len(input_data) || input_data[next] != ':' {
                    read_char() /* consume ':' */
                    last_token = label
                    trail_after(label)
                    if debug_lexer { fmt.eprintf("LEX: label '%s'\n", word) }
                    return label, 0
                }
            }
            last_token = identifier
            if debug_lexer { fmt.eprintf("LEX: identifier '%s'\n", word) }
            return identifier, 0
        }

        /* symbol :identifier */
        if c == ':' {
            c2 := peek_char()
            if c2 == ':' {
                read_char()
                last_token = op_colon2
                trail_after(op_colon2)
                if debug_lexer { fmt.eprintln("LEX: op_colon2") }
                return op_colon2, 0
            }
            if is_alpha(c2) {
                read_char()
                read_ident() /* consume the symbol name */
                last_token = lit_symbol
                if debug_lexer { fmt.eprintln("LEX: lit_symbol") }
                return lit_symbol, 0
            }
            /* lone colon - shouldn't normally appear, but return as char */
            last_token = ':'
            return ':', 0
        }

        /* operators */
        if c == '-' {
            c2 := peek_char()
            if c2 == '>' {
                read_char()
                last_token = op_lambda
                trail_after(op_lambda)
                if debug_lexer { fmt.eprintln("LEX: op_lambda") }
                return op_lambda, 0
            }
            last_token = op_minus
            trail_after(op_minus)
            if debug_lexer { fmt.eprintln("LEX: op_minus") }
            return op_minus, 0
        }

        if c == '<' {
            c2 := peek_char()
            if c2 == '-' {
                read_char()
                last_token = op_lasgn
                trail_after(op_lasgn)
                if debug_lexer { fmt.eprintln("LEX: op_lasgn") }
                return op_lasgn, 0
            }
            if c2 == '=' {
                read_char()
                last_token = op_le
                trail_after(op_le)
                if debug_lexer { fmt.eprintln("LEX: op_le") }
                return op_le, 0
            }
            last_token = op_lt
            trail_after(op_lt)
            if debug_lexer { fmt.eprintln("LEX: op_lt") }
            return op_lt, 0
        }

        if c == '>' {
            c2 := peek_char()
            if c2 == '=' {
                read_char()
                last_token = op_ge
                trail_after(op_ge)
                if debug_lexer { fmt.eprintln("LEX: op_ge") }
                return op_ge, 0
            }
            last_token = op_gt
            trail_after(op_gt)
            if debug_lexer { fmt.eprintln("LEX: op_gt") }
            return op_gt, 0
        }

        if c == '=' {
            c2 := peek_char()
            if c2 == '=' {
                read_char()
                last_token = op_eq
                trail_after(op_eq)
                if debug_lexer { fmt.eprintln("LEX: op_eq") }
                return op_eq, 0
            }
            if c2 == '>' {
                read_char()
                last_token = op_rasgn
                trail_after(op_rasgn)
                if debug_lexer { fmt.eprintln("LEX: op_rasgn") }
                return op_rasgn, 0
            }
            last_token = '='
            trail_after('=')
            if debug_lexer { fmt.eprintln("LEX: '='") }
            return '=', 0
        }

        if c == '!' {
            c2 := peek_char()
            if c2 == '=' {
                read_char()
                last_token = op_neq
                trail_after(op_neq)
                if debug_lexer { fmt.eprintln("LEX: op_neq") }
                return op_neq, 0
            }
            last_token = '!'
            if debug_lexer { fmt.eprintln("LEX: '!'") }
            return '!', 0
        }

        if c == '&' {
            c2 := peek_char()
            if c2 == '&' {
                read_char()
                last_token = op_and
                trail_after(op_and)
                if debug_lexer { fmt.eprintln("LEX: op_and") }
                return op_and, 0
            }
            last_token = op_amper
            trail_after(op_amper)
            if debug_lexer { fmt.eprintln("LEX: op_amper") }
            return op_amper, 0
        }

        if c == '|' {
            c2 := peek_char()
            if c2 == '|' {
                read_char()
                last_token = op_or
                trail_after(op_or)
                if debug_lexer { fmt.eprintln("LEX: op_or") }
                return op_or, 0
            }
            last_token = op_bar
            leading_trail_after(op_bar)
            if debug_lexer { fmt.eprintln("LEX: op_bar") }
            return op_bar, 0
        }

        if c == '+' {
            last_token = op_plus
            trail_after(op_plus)
            if debug_lexer { fmt.eprintln("LEX: op_plus") }
            return op_plus, 0
        }

        if c == '*' {
            last_token = op_mult
            trail_after(op_mult)
            if debug_lexer { fmt.eprintln("LEX: op_mult") }
            return op_mult, 0
        }

        if c == '/' {
            last_token = op_div
            trail_after(op_div)
            if debug_lexer { fmt.eprintln("LEX: op_div") }
            return op_div, 0
        }

        if c == '%' {
            last_token = op_mod
            trail_after(op_mod)
            if debug_lexer { fmt.eprintln("LEX: op_mod") }
            return op_mod, 0
        }

        if c == '~' {
            last_token = '~'
            if debug_lexer { fmt.eprintln("LEX: '~'") }
            return '~', 0
        }

        if c == '@' {
            last_token = '@'
            if debug_lexer { fmt.eprintln("LEX: '@'") }
            return '@', 0
        }

        /* ')' - check for lambda2/lambda3 */
        if c == ')' {
            /* Look ahead for -> or ->{ patterns */
            saved_pos := input_pos
            saved_line := lineno
            found_lambda := false

            /* skip spaces */
            for peek_char() == ' ' || peek_char() == '\t' {
                read_char()
            }
            if peek_char() == '-' {
                read_char()
                if peek_char() == '>' {
                    read_char()
                    /* check for ->{ */
                    for peek_char() == ' ' || peek_char() == '\t' {
                        read_char()
                    }
                    if peek_char() == '{' {
                        read_char()
                        last_token = op_lambda3
                        trail_after(op_lambda3)
                        if debug_lexer { fmt.eprintln("LEX: ')' + op_lambda3") }
                        /* Return ')' first, then queue lambda3 */
                        /* Actually we need to return ')' and then op_lambda3.
                           But push parser gets one token at a time.
                           In the grammar, op_lambda2/3 appears after ')',
                           so we return ')' first and set up to return lambda3 next */
                        pending_token = op_lambda3
                        has_pending = true
                        last_token = ')'
                        return ')', 0
                    } else {
                        last_token = op_lambda2
                        trail_after(op_lambda2)
                        if debug_lexer { fmt.eprintln("LEX: ')' + op_lambda2") }
                        pending_token = op_lambda2
                        has_pending = true
                        last_token = ')'
                        return ')', 0
                    }
                }
            }
            /* Not a lambda - restore */
            input_pos = saved_pos
            lineno = saved_line
            last_token = ')'
            if debug_lexer { fmt.eprintln("LEX: ')'") }
            return ')', 0
        }

        /* delimiters */
        if c == '(' {
            last_token = '('
            trail_after('(')
            if debug_lexer { fmt.eprintln("LEX: '('") }
            return '(', 0
        }
        if c == '[' {
            last_token = '['
            trail_after('[')
            if debug_lexer { fmt.eprintln("LEX: '['") }
            return '[', 0
        }
        if c == ']' {
            last_token = ']'
            if debug_lexer { fmt.eprintln("LEX: ']'") }
            return ']', 0
        }
        if c == '{' {
            last_token = '{'
            trail_after('{')
            if debug_lexer { fmt.eprintln("LEX: '{'") }
            return '{', 0
        }
        if c == '}' {
            last_token = '}'
            if debug_lexer { fmt.eprintln("LEX: '}'") }
            return '}', 0
        }
        if c == ',' {
            last_token = ','
            trail_after(',')
            if debug_lexer { fmt.eprintln("LEX: ','") }
            return ',', 0
        }
        if c == ';' {
            last_token = ';'
            trail_after(';')
            if debug_lexer { fmt.eprintln("LEX: ';'") }
            return ';', 0
        }
        if c == '.' {
            last_token = '.'
            leading_trail_after('.')
            if debug_lexer { fmt.eprintln("LEX: '.'") }
            return '.', 0
        }

        /* unknown character - skip */
        if debug_lexer { fmt.eprintf("LEX: unknown char %d '%c'\n", c, rune(c)) }
    }
}

/* Pending token mechanism for ) -> lambda2/3 split */
pending_token : int = 0
has_pending : bool = false

get_next_token :: proc() -> (int, YYSTYPE) {
    if has_pending {
        tok := pending_token
        has_pending = false
        last_token = tok
        if debug_lexer { fmt.eprintf("LEX: pending token %d\n", tok) }
        return tok, 0
    }
    return streem_yylex()
}

/* ============================================================
 * Main
 * ============================================================ */

streem_yyerror :: proc(msg: string) {
    fmt.eprintf("%d: %s\n", lineno, msg)
}

main :: proc() {
    yyerror = streem_yyerror

    args := os.args
    filename : string
    data : []u8
    ok : bool

    if len(args) < 2 {
        fmt.eprintln("Usage: streem_parser [-d] <file.strm>")
        os.exit(1)
    }

    arg_idx := 1
    for arg_idx < len(args) {
        if args[arg_idx] == "-d" {
            debug_lexer = true
            arg_idx += 1
        } else {
            break
        }
    }

    if arg_idx >= len(args) {
        fmt.eprintln("Usage: streem_parser [-d] <file.strm>")
        os.exit(1)
    }

    filename = args[arg_idx]
    data, ok = os.read_entire_file(filename)
    if !ok {
        fmt.eprintf("Error: cannot read file '%s'\n", filename)
        os.exit(1)
    }

    input_data = data
    input_pos = 0
    lineno = 1
    last_token = 0

    ctx : YYParseContext
    yyparse_init(&ctx)

    result : int
    for {
        token, value := get_next_token()
        result = yyparse_push(&ctx, token, value)
        if result != YYPUSH_MORE {
            break
        }
    }

    if result == 0 {
        fmt.printf("Parse OK: %s\n", filename)
    } else {
        fmt.eprintf("Parse FAILED: %s\n", filename)
        os.exit(1)
    }
}
