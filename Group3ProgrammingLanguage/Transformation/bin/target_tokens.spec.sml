(*#line 2.10 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*)functor Target_LexFn(val getNextTokenPos : string -> {line: word, column: word})(*#line 1.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
=
   struct
    structure UserDeclarations =
      struct
(*#line 1.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*)(*#line 6.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
end (* end of user routines *)
exception LexError (* raised if illegal leaf action tried *)
structure Internal =
	struct

datatype yyfinstate = N of int
type statedata = {fin : yyfinstate list, trans: string}
(* transition & final state table *)
val tab = let
val s = [ 
 (0, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (1, 
"\003\003\003\003\003\003\003\003\003\073\074\003\003\003\003\003\
\\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\
\\073\071\003\003\003\070\003\003\069\068\067\065\003\063\003\062\
\\061\059\059\059\059\059\059\059\059\059\003\058\056\054\052\003\
\\003\006\006\006\006\006\048\006\006\006\006\006\006\006\006\006\
\\006\006\006\006\044\006\006\006\006\006\006\003\003\003\043\003\
\\003\038\034\006\006\030\027\006\006\023\006\006\006\006\020\018\
\\013\006\006\006\006\006\006\008\006\006\006\005\003\004\003\003\
\\003"
),
 (6, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (8, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\009\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (9, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\010\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (10, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\011\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (11, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\012\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (13, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\014\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (14, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\015\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (15, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\016\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (16, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\017\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (18, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\019\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (20, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\021\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (21, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\022\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (23, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\026\007\007\007\007\007\007\007\024\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (24, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\025\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (27, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\028\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (28, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\029\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (30, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\031\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (31, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\032\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (32, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\033\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (34, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\035\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (35, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\036\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (36, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\037\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (38, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\041\007\007\007\007\007\007\007\007\007\007\007\039\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (39, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\040\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (41, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\042\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (44, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\045\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (45, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\046\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (46, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\047\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (48, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\049\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (49, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\050\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (50, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\007\007\007\007\007\007\007\007\007\007\000\000\000\000\000\000\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\007\007\007\007\007\007\007\007\000\000\000\000\007\
\\000\007\007\007\007\007\007\007\007\007\007\007\007\007\007\007\
\\007\007\007\051\007\007\007\007\007\007\007\000\000\000\000\000\
\\000"
),
 (52, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\053\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (54, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\055\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (56, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\057\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (59, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\060\060\060\060\060\060\060\060\060\060\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (63, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\064\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (65, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\066\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (71, 
"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\072\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
 (73, 
"\000\000\000\000\000\000\000\000\000\074\074\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\074\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\\000"
),
(0, "")]
fun f x = x 
val s = map f (rev (tl (rev s))) 
exception LexHackingError 
fun look ((j,x)::r, i: int) = if i = j then x else look(r, i) 
  | look ([], i) = raise LexHackingError
fun g {fin=x, trans=i} = {fin=x, trans=look(s,i)} 
in Vector.fromList(map g 
[{fin = [], trans = 0},
{fin = [], trans = 1},
{fin = [], trans = 1},
{fin = [(N 115)], trans = 0},
{fin = [(N 19),(N 115)], trans = 0},
{fin = [(N 17),(N 115)], trans = 0},
{fin = [(N 113),(N 115)], trans = 6},
{fin = [(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 8},
{fin = [(N 113)], trans = 9},
{fin = [(N 113)], trans = 10},
{fin = [(N 113)], trans = 11},
{fin = [(N 75),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 13},
{fin = [(N 113)], trans = 14},
{fin = [(N 113)], trans = 15},
{fin = [(N 113)], trans = 16},
{fin = [(N 96),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 18},
{fin = [(N 90),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 20},
{fin = [(N 113)], trans = 21},
{fin = [(N 83),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 23},
{fin = [(N 113)], trans = 24},
{fin = [(N 10),(N 113)], trans = 6},
{fin = [(N 64),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 27},
{fin = [(N 113)], trans = 28},
{fin = [(N 79),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 30},
{fin = [(N 113)], trans = 31},
{fin = [(N 113)], trans = 32},
{fin = [(N 69),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 34},
{fin = [(N 113)], trans = 35},
{fin = [(N 113)], trans = 36},
{fin = [(N 15),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 38},
{fin = [(N 113)], trans = 39},
{fin = [(N 87),(N 113)], trans = 6},
{fin = [(N 113)], trans = 41},
{fin = [(N 6),(N 113)], trans = 6},
{fin = [(N 45),(N 115)], trans = 0},
{fin = [(N 113),(N 115)], trans = 44},
{fin = [(N 113)], trans = 45},
{fin = [(N 113)], trans = 46},
{fin = [(N 106),(N 113)], trans = 6},
{fin = [(N 113),(N 115)], trans = 48},
{fin = [(N 113)], trans = 49},
{fin = [(N 113)], trans = 50},
{fin = [(N 113)], trans = 46},
{fin = [(N 55),(N 115)], trans = 52},
{fin = [(N 61)], trans = 0},
{fin = [(N 27),(N 115)], trans = 54},
{fin = [(N 48)], trans = 0},
{fin = [(N 53),(N 115)], trans = 56},
{fin = [(N 58)], trans = 0},
{fin = [(N 25),(N 115)], trans = 0},
{fin = [(N 110),(N 115)], trans = 59},
{fin = [(N 110)], trans = 59},
{fin = [(N 110),(N 115)], trans = 0},
{fin = [(N 37),(N 115)], trans = 0},
{fin = [(N 43),(N 115)], trans = 63},
{fin = [(N 33)], trans = 0},
{fin = [(N 41),(N 115)], trans = 65},
{fin = [(N 30)], trans = 0},
{fin = [(N 39),(N 115)], trans = 0},
{fin = [(N 23),(N 115)], trans = 0},
{fin = [(N 21),(N 115)], trans = 0},
{fin = [(N 35),(N 115)], trans = 0},
{fin = [(N 115)], trans = 71},
{fin = [(N 51)], trans = 0},
{fin = [(N 2),(N 115)], trans = 73},
{fin = [(N 2)], trans = 73}])
end
structure StartStates =
	struct
	datatype yystartstate = STARTSTATE of int

(* start state definitions *)

val INITIAL = STARTSTATE 1;

end
type result = UserDeclarations.lexresult
	exception LexerError (* raised if illegal leaf action tried *)
end

structure YYPosInt : INTEGER = Int
fun makeLexer yyinput =
let	val yygone0= YYPosInt.fromInt ~1
	val yyb = ref "\n" 		(* buffer *)
	val yybl = ref 1		(*buffer length *)
	val yybufpos = ref 1		(* location of next character to use *)
	val yygone = ref yygone0	(* position in file of beginning of buffer *)
	val yydone = ref false		(* eof found yet? *)
	val yybegin = ref 1		(*Current 'start state' for lexer *)

	val YYBEGIN = fn (Internal.StartStates.STARTSTATE x) =>
		 yybegin := x

fun lex () : Internal.result =
let fun continue() = lex() in
  let fun scan (s,AcceptingLeaves : Internal.yyfinstate list list,l,i0) =
	let fun action (i,nil) = raise LexError
	| action (i,nil::l) = action (i-1,l)
	| action (i,(node::acts)::l) =
		case node of
		    Internal.N yyk => 
			(let fun yymktext() = substring(!yyb,i0,i-i0)
			     val yypos = YYPosInt.+(YYPosInt.fromInt i0, !yygone)
			open UserDeclarations Internal.StartStates
 in (yybufpos := i; case yyk of 

			(* Application actions *)

  10 => let val yytext=yymktext() in (*#line 16.21 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 593.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 106 => let val yytext=yymktext() in (*#line 46.17 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL("boolean"  , yytext, getNextTokenPos(yytext))  (*#line 595.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 110 => let val yytext=yymktext() in (*#line 47.17 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL("integer"  , yytext, getNextTokenPos(yytext))  (*#line 597.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 113 => let val yytext=yymktext() in (*#line 48.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL("identifier"  , yytext, getNextTokenPos(yytext))  (*#line 599.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 115 => let val yytext=yymktext() in (*#line 52.35 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) error("ignored an unprintable character: " ^ yytext); getNextTokenPos(yytext); lex()  (*#line 601.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 15 => let val yytext=yymktext() in (*#line 17.22 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 603.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 17 => let val yytext=yymktext() in (*#line 18.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 605.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 19 => let val yytext=yymktext() in (*#line 19.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 607.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 2 => let val yytext=yymktext() in (*#line 14.18 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) getNextTokenPos(yytext); lex()  (*#line 609.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 21 => let val yytext=yymktext() in (*#line 20.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 611.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 23 => let val yytext=yymktext() in (*#line 21.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 613.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 25 => let val yytext=yymktext() in (*#line 22.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 615.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 27 => let val yytext=yymktext() in (*#line 23.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 617.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 30 => let val yytext=yymktext() in (*#line 24.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 619.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 33 => let val yytext=yymktext() in (*#line 25.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 621.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 35 => let val yytext=yymktext() in (*#line 26.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 623.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 37 => let val yytext=yymktext() in (*#line 27.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 625.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 39 => let val yytext=yymktext() in (*#line 28.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 627.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 41 => let val yytext=yymktext() in (*#line 29.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 629.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 43 => let val yytext=yymktext() in (*#line 30.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 631.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 45 => let val yytext=yymktext() in (*#line 31.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 633.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 48 => let val yytext=yymktext() in (*#line 32.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 635.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 51 => let val yytext=yymktext() in (*#line 33.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 637.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 53 => let val yytext=yymktext() in (*#line 34.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 639.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 55 => let val yytext=yymktext() in (*#line 35.19 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 641.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 58 => let val yytext=yymktext() in (*#line 36.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 643.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 6 => let val yytext=yymktext() in (*#line 15.21 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 645.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 61 => let val yytext=yymktext() in (*#line 37.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 647.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 64 => let val yytext=yymktext() in (*#line 38.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 649.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 69 => let val yytext=yymktext() in (*#line 39.22 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 651.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 75 => let val yytext=yymktext() in (*#line 40.23 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 653.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 79 => let val yytext=yymktext() in (*#line 41.21 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 655.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 83 => let val yytext=yymktext() in (*#line 42.21 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 657.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 87 => let val yytext=yymktext() in (*#line 43.21 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 659.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 90 => let val yytext=yymktext() in (*#line 44.20 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 661.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| 96 => let val yytext=yymktext() in (*#line 45.23 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec"*) SHELL(yytext  , yytext, getNextTokenPos(yytext))  (*#line 663.1 "C:\Users\cmcgr\Documents\lang\Group3ProgrammingLanguage\Group3ProgrammingLanguage\Transformation\bin\target_tokens.spec.sml"*)
 end
| _ => raise Internal.LexerError

		) end )

	val {fin,trans} = Vector.sub(Internal.tab, s)
	val NewAcceptingLeaves = fin::AcceptingLeaves
	in if l = !yybl then
	     if trans = #trans(Vector.sub(Internal.tab,0))
	       then action(l,NewAcceptingLeaves
) else	    let val newchars= if !yydone then "" else yyinput 1024
	    in if (size newchars)=0
		  then (yydone := true;
		        if (l=i0) then UserDeclarations.eof ()
		                  else action(l,NewAcceptingLeaves))
		  else (if i0=l then yyb := newchars
		     else yyb := substring(!yyb,i0,l-i0)^newchars;
		     yygone := YYPosInt.+(!yygone, YYPosInt.fromInt i0);
		     yybl := size (!yyb);
		     scan (s,AcceptingLeaves,l-i0,0))
	    end
	  else let val NewChar = Char.ord(CharVector.sub(!yyb,l))
		val NewChar = if NewChar<128 then NewChar else 128
		val NewState = Char.ord(CharVector.sub(trans,NewChar))
		in if NewState=0 then action(l,NewAcceptingLeaves)
		else scan(NewState,NewAcceptingLeaves,l+1,i0)
	end
	end
(*
	val start= if substring(!yyb,!yybufpos-1,1)="\n"
then !yybegin+1 else !yybegin
*)
	in scan(!yybegin (* start *),nil,!yybufpos,!yybufpos)
    end
end
  in lex
  end
end
