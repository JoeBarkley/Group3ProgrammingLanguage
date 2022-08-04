%%
%header (functor Target_LexFn(val getNextTokenPos : string -> {line: word, column: word}));

alpha        = [A-Za-z];
digit        = [0-9];
posDigit    = [1-9];
integer = 0|{posDigit}{digit}*;
alphanumeric = [A-Za-z0-9_];
ws           = [\  \t \n];
boolean      = "True" | "False";
identifier   = {alpha}{alphanumeric}*;

%%
{ws}+        => ( getNextTokenPos(yytext); lex()  );
"abs"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"int"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"bool"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"{"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"}"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"("           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
")"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
";"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"="           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"++"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"--"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"%"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"/"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"*"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"+"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"-"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"^"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"=="           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"!="           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"<"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
">"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"<="           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
">="           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"if"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"else"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"while"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"for"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"not"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"and"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"or"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
"print"           => ( SHELL(yytext  , yytext, getNextTokenPos(yytext))  );
{boolean}   => ( SHELL("boolean"  , yytext, getNextTokenPos(yytext))  );
{integer}   => ( SHELL("integer"  , yytext, getNextTokenPos(yytext))  );
{identifier}   => ( SHELL("identifier"  , yytext, getNextTokenPos(yytext))  );



 .                            => ( error("ignored an unprintable character: " ^ yytext); getNextTokenPos(yytext); lex()  );
