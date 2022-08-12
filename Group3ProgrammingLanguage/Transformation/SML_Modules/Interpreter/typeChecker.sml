(* =========================================================================================================== *)
structure TypeChecker =
struct

open Model;
open CONCRETE_REPRESENTATION;

(* =========================================================================================================== *)
(*
    Here is where your typeCheck and typeOf definitions go. The primary challenge here is to translate the parse 
    expression notation we used in M2 to the actual SML tree patterns used in the TL System. See the comments in
    the semantics.sml file for a more detailed discussion on this topic. 
*)


fun typeCheck( itree(inode("prog",_),
	[ 
		stmt_list
	] 
), m) = typeCheck(stmt_list, m)

|	typeCheck(	itree(inode("stmt_list", _),
	[
		stmt1,
		itree(inode(";", _), []),
		stmtList1
	]
), m0) = typeCheck(stmtList1, typeCheck(stmt1, m0))

(*typeCheck(epsillon) still needs to be implemented*)

(*Generic typeCheck for any statement; leads into specifics*)

|	typeCheck(	itree(inode("stmt", _),
	[
		stmt1
	]
), m0) = typeCheck(stmt1, m0)

(*typeCheck for assignStmt of form "identifier = expression"*)
|	typeCheck(	itree(inode("assignStmt", _),
	[
		identifier,
		itree(inode("=", _), []),
		expression1
	]
), m) = let
			val t1 = typeOf(expression1, m)
			val t2 = getType(accessEnv(identifier, m))
		in
			if t1 = t2 then m else raise Fail(identifier ^ " does not match expression type")
		end
		
(*typeCheck for assignStmt of form "int identifier = expression"*)
|	typeCheck(	itree(inode("assignStmt", _),
	[
		itree(inode("int", _), []),
		identifier,
		itree(inode("=", _), []),
		expression1
	]
), m) = let
			val t1 = typeOf(expression1, m)
		in
			if t1 = INT
			then updateEnv(identifier, int, m)
			else raise Fail(identifier ^ " not defined as integer")
		end

(*typeCheck for assignStmt of form "bool identifier = expression"*)
|   typeCheck(  itree(inode("assignStmt", _),
    [
        itree(inode("bool", _), []),
        identifier,
        itree(inode("=", _), []),
        expression1
    ]
), m) = let
            val t1 = typeOf(expression1, m)
        in
            if t1 = BOOL
            then updateEnv(identifier, int, m)
            else raise Fail(identifier ^ " not defined as boolean")
        end

(*typeCheck for decStmt of form "int identifier"*)
|   typeCheck(  itree(inode("decStmt", _),
    [
        itree(inode("int", _), []),
        identifier
    ]
), m) = updateEnv(identifier, INT, m)

(*typeCheck for decStmt of form "bool identifier"*)
|   typeCheck(  itree(inode("decStmt", _),
    [
        itree(inode("bool", _), []),
        identifier
    ]
), m) = updateEnv(identifier, BOOL, m)

(*typeCheck for condStmt of form "if (expression) block"*)
|   typeCheck(  itree(inode("condStmt", _),
    [
        itree(inode("if", _), []),
        itree(inode("(", _), []),
        expression1,
        itree(inode(")", _), []),
        block1
    ]
), m0) = let
            val t = typeOf(expression1, m0)
            val m1 = typeCheck(block1, m0)
         in
            if t = BOOL
            then m0
            else raise Fail("Expression \"" ^ expression1 ^ "\" does not evaluate to bool")
         end
         
(*typeCheck for condStmt of form "if (expression) block1 else block2"*)
|   typeCheck(  itree(inode("condStmt", _),
    [
        itree(inode("if", _), []),
        itree(inode("(", _), []),
        expression1,
        itree(inode(")", _), []),
        block1,
        itree(inode("else", _), []),
        block2
    ]
), m0) = let
            val t = typeOf(expression1, m0)
            val m1 = typeCheck(block1, m0)
            val m2 = typeCheck(block2, m0)
         in
            if t = BOOL
            then m0
            else raise Fail("Expression \"" ^ expression1 ^ "\" does not evaluate to bool")
         end
         
(*typeCheck for generic iterStmt*)
|   typeCheck(  itree(inode("iterStmt", _),
    [
        iterStmt
    ]
), m) = typeCheck(iterStmt, m)

(*typeCheck for whileLoop*)
|   typeCheck(  itree(inode("whileLoop", _),
    [
        itree(inode("while", _), []),
        itree(inode("(", _), []),
        expression1,
        itree(inode(")", _), []),
        block1
    ]
), m0) = let
            val t = typeOf(expression1, m0)
            val m1 = typeCheck(block1, m0)
         in
            if t = BOOL
            then m0
            else raise Fail("Expression \"" ^ expression1 ^ "\" does not evaluate to bool")
         end
         
(*typeCheck for forLoop*)
|   typeCheck(  itree(inode("forLoop", _),
    [
        itree(inode("for", _), []),
        itree(inode("(", _), []),
        assignStmt1,
        itree(inode(";", _), []),
        termination1,
        itree(inode(";", _), []),
        decoratedId1,
        itree(inode(")", _), []),
        block1
    ]
), m0) = let
            val m1 = typeCheck(assignStmt1, m0)
            val t1 = typeOf(termination1, m0)
            val t2 = typeOf(decoratedId1, m0)
         in
            if t = BOOL andalso t2 = INT
            then m0
            else raise Fail("For loop terms \"" ^ termination1 ^ "\" and \"" ^ decoratedId1 ^ "\" not of correct type")
         end
         
(*typeCheck for printStmt*)
|   typeCheck(  itree(inode("printStmt", _),
    [
        itree(inode("print", _), []),
        itree(inode("(", _), []),
        expression1,
        itree(inode(")", _), [])
    ]
), m) = let
            val t = typeOf(expression1, m)
        in
            if t <> ERROR
            then m
            else raise Fail("Expression \"" ^ expression1 ^ "\" not of valid type")
        end

(*typeCheck for decoratedId*)
|   typeCheck(  itree(inode("decoratedId", _),
    [
        decoratedId1
    ]
), m) = let
            val t = typeOf(decoratedId1, m)
        in
            if t = INT
            then m
            else raise Fail("Decorated ID \" ^ decoratedId1 ^ "\" not of type integer")
        end
        
(*typeOf for termination*)
|   typeOf( itree(inode("termination", _),
    [
        expression1,
    ]
), m) = let
            val t1 = typeOf(expression1, m)
        in
            if t1 = BOOL
            then BOOL
            else ERROR
        end
        
(*typeOf for decoratedId of form "++identifier"*)
|   typeOf( itree(inode("decoratedId", _),
    [
        itree(inode("++",_),[]),
        identifier
    ]
), m) = let
            val t = getType(accessEnv(identifier,m))
        in
            if t = INT then INT else ERROR
        end
        
(*typeOf for decoratedId of form "--identifier"*)
|   typeOf( itree(inode("decoratedId",_),
    [
        itree(inode("--",_),[]),
        identifier
    ]
), m) = let
            val t = getType(accessEnv(identifier,m))
        in
            if t = INT then INT else ERROR
        end

(*typeOf for decoratedId of form "identifier++"*)
|   typeOf( itree(inode("decoratedId",_),
    [
        identifier,
        itree(inode("++",_),[])
    ]
), m) = let
            val t = getType(accessEnv(identifier,m))
        in
            if t = INT then INT else ERROR
        end

(*typeOf for decoratedId of form "identifier--"*)
|   typeOf( itree(inode("decoratedId",_),
    [
        identifier,
        itree(inode("--",_),[])
    ]
), m) = let
            val t = getType(accessEnv(identifier,m))
        in
            if t = INT then INT else ERROR
        end

(*typeOf for base expression*)
|   typeOf( itree(inode("expression",_),
    [
        logicalExp1
    ]
), m) = typeOf(logicalExp1,m)

(*typeOf for logical expression of form "logicalExp or logicalTerm"*)
|   typeOf( itree(inode("logicalExp",_),
    [
        logicalExp1,
        itree(inode("or",_),[]),
        logicalTerm1
    ]
), m) = let
            val t1 = typeOf(logicalExp1,m)
            val t2 = typeOf(logicalTerm1,m)
        in
            if t1 = t2 andalso t1 = BOOL then BOOL
            else ERROR
        end

(*typeOf for logical expression of form "logicalTerm"*)
|   typeOf( itree(inode("logicalExp",_),
    [
        logicalTerm1
    ]
), m) = typeOf(logicalTerm1,m)

(*typeOf for logical term of form "logicalTerm and relationalExp"*)
|   typeOf( itree(inode("logicalTerm",_),
    [
        logicalTerm1,
        itree(inode("and",_),[]),
        relationalExp1
    ]
), m) = let
            val t1 = typeOf(logicalTerm1,m)
            val t2 = typeOf(relationalExp1,m)
        in
            if t1 = t2 andalso t1 = BOOL then BOOL
            else ERROR
        end

(*typeOf for logical term of form "relationalExp"*)
|   typeOf( itree(inode("logicalTerm",_),
    [
        relationalExp1
    ]
), m) = typeOf(relationalExp1,m)

(*typeOf for relational expression of form "relationalExp == arithmeticExp"*)
|   typeOf( itree(inode("relationalExp",_),
    [
        relationalExp1,
        itree(inode("==",_),[]),
        arithmeticExp1
    ]
), m) = let
            val t1 = typeOf(relationalExp1,m)
            val t2 = typeOf(arithmeticExp1,m)
        in
            if t1 = t2 and t1 <> ERROR then BOOL
            else ERROR
        end

(*typeOf for relational expression of form "relationalExp != arithmeticExp"*)
|   typeOf( itree(inode("relationalExp",_),
    [
        relationalExp1,
        itree(inode("!=",_),[]),
        arithmeticExp1
    ]
), m) = let
            val t1 = typeOf(relationalExp1,m)
            val t2 = typeOf(arithmeticExp1,m)
        in
            if t1 = t2 and t1 <> ERROR then BOOL
            else ERROR
        end

(*typeOf for relational expression of form "relationalExp > arithmeticExp"*)
|   typeOf( itree(inode("relationalExp",_),
    [
        relationalExp1,
        itree(inode(">",_),[]),
        arithmeticExp1
    ]
), m) = let
            val t1 = typeOf(relationalExp1,m)
            val t2 = typeOf(arithmeticExp1,m)
        in
            if t1 = t2 and t1 <> ERROR then BOOL
            else ERROR
        end
        
(*typeOf for relational expression of form "relationalExp < arithmeticExp"*)
|   typeOf( itree(inode("relationalExp",_),
    [
        relationalExp1,
        itree(inode("<",_),[]),
        arithmeticExp1
    ]
), m) = let
            val t1 = typeOf(relationalExp1,m)
            val t2 = typeOf(arithmeticExp1,m)
        in
            if t1 = t2 and t1 <> ERROR then BOOL
            else ERROR
        end

(*typeOf for relational expression of form "arithmeticExp"*)
|   typeOf( itree(inode("relationalExp",_),
    [
        arithmeticExp1
    ]
), m) = typeOf(arithmeticExp1,m)

(*typeOf for arithmetic expression of form "arithmeticExp + arithmeticTerm"*)
|   typeOf( itree(inode("arithmeticExp",_),
    [
        arithmeticExp1,
        itree(inode("+",_),[]),
        arithmeticTerm1
    ]
), m) = let
            val t1 = typeOf(arithmeticExp1,m)
            val t2 = typeOf(arithmeticTerm1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end
        
(*typeOf for arithmetic expression of form "arithmeticExp - arithmeticTerm"*)
|   typeOf( itree(inode("arithmeticExp",_),
    [
        arithmeticExp1,
        itree(inode("-",_),[]),
        arithmeticTerm1
    ]
), m) = let
            val t1 = typeOf(arithmeticExp1,m)
            val t2 = typeOf(arithmeticTerm1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end
        
(*typeOf for arithmetic expression of form "arithmeticTerm"*)
|   typeOf( itree(inode("arithmeticExp",_),
    [
        arithmeticTerm1
    ]
), m) = typeOf(arithmeticTerm1,m)

(*typeOf for arithmetic term of form "arithmeticTerm * arithmeticEntry"*)
|   typeOf( itree(inode("arithmeticTerm",_),
    [
        arithmeticTerm1,
        itree(inode("*",_),[]),
        arithmeticEntry1
    ]
), m) = let
            val t1 = typeOf(arithmeticTerm1,m)
            val t2 = typeOf(arithmeticEntry1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end
        
(*typeOf for arithmetic term of form "arithmeticTerm / arithmeticEntry"*)
|   typeOf( itree(inode("arithmeticTerm",_),
    [
        arithmeticTerm1,
        itree(inode("/",_),[]),
        arithmeticEntry1
    ]
), m) = let
            val t1 = typeOf(arithmeticTerm1,m)
            val t2 = typeOf(arithmeticEntry1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end
        
(*typeOf for arithmetic term of form "arithmeticTerm % arithmeticEntry"*)
|   typeOf( itree(inode("arithmeticTerm",_),
    [
        arithmeticTerm1,
        itree(inode("%",_),[]),
        arithmeticEntry1
    ]
), m) = let
            val t1 = typeOf(arithmeticTerm1,m)
            val t2 = typeOf(arithmeticEntry1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end

(*typeOf for arithmetic term of form "arithmeticEntry"*)
|   typeOf( itree(inode("arithmeticTerm",_),
    [
        arithmeticEntry1
    ]
), m) = typeOf(arithmeticEntry1,m)

(*typeOf for arithmetic entry of form "-exponentTerm"*)
|   typeOf( itree(inode("arithmeticEntry",_),
    [
        itree(inode("-",_),[]),
        exponentTerm1
    ]
), m) = let
            val t1 = typeOf(exponentTerm1,m)
        in
            if t1 = INT then INT
            else ERROR
        end
        
(*typeOf for arithmetic entry of form "not exponentTerm"*)
|   typeOf( itree(inode("arithmeticEntry",_),
    [
        itree(inode("not",_),[]),
        exponentTerm1
    ]
), m) = let
            val t1 = typeOf(exponentTerm1,m)
        in
            if t1 = BOOL then BOOL
            else ERROR
        end
        
(*typeOf for arithmetic entry of form "exponentTerm"*)
|   typeOf( itree(inode("arithmeticEntry",_),
    [
        exponentTerm1
    ]
), m) = typeOf(exponentTerm1,m)

(*typeOf for exponent term of form "baseTerm ^ exponentTerm"*)
|   typeOf( itree(inode("exponentTerm",_),
    [
        baseTerm1,
        itree(inode("^",_),[]),
        exponentTerm1
    ]
), m) = let
            val t1 = typeOf(baseTerm1,m)
            val t2 = typeOf(exponentTerm1,m)
        in
            if t1 = t2 andalso t1 = INT then INT
            else ERROR
        end
        
(*typeOf for exponent term of form "baseTerm"*)
|   typeOf( itree(inode("exponentTerm",_),
    [
        baseTerm1
    ]
), m) = typeOf(baseTerm1,m)

(*typeOf for base term of form "(expression)"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("(",_),[]),
        expression1,
        itree(inode(")",_),[])
    ]
), m = typeOf(expression1,m)

(*typeOf for base term of form "abs(expression)"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("abs",_),[]),
        itree(inode("(",_),[]),
        expression1,
        itree(inode(")",_),[])
    ]
), m) = let
            val t1 = typeOf(expression1,m)
        in
            if t1 = INT then INT
            else ERROR
        end
        
(*typeOf for base term of form "identifier"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        identifier
    ]
), m) = getType(accessEnv(identifier,m))

(*typeOf for base term of form "integer"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("int",_),[])
    ]
), m) = INT

(*typeOf for base term of form "boolean"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("bool",_),[])
    ]
), m) = BOOL

(*typeOf for base term of form "++decoratedId"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("decoratedId",_),
            [
                itree(inode("++",_),[]),
                decoratedId1
            ]
        ), m)
    ]
), m) = typeOf(decoratedId1,m)

(*typeOf for base term of form "--decoratedId"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("decoratedId",_),
            [
                itree(inode("--",_),[]),
                decoratedId1
            ]
        ), m)
    ]
), m) = typeOf(decoratedId1,m)

(*typeOf for base term of form "decoratedId++"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("decoratedId",_),
            [
                decoratedId1,
                itree(inode("++",_),[])
            ]
        ), m)
    ]
), m) = typeOf(decoratedId1,m)

(*typeOf for base term of form "decoratedId--"*)
|   typeOf( itree(inode("baseTerm",_),
    [
        itree(inode("decoratedId",_),
            [
                decoratedId1,
                itree(inode("--",_),[])
            ]
        ), m)
    ]
), m) = typeOf(decoratedId1,m)

  | typeCheck( itree(inode(x_root,_), children),_) = raise General.Fail("\n\nIn typeCheck root = " ^ x_root ^ "\n\n")
  | typeCheck _ = raise Fail("Error in Model.typeCheck - this should never occur")


(* =========================================================================================================== *)  
end (* struct *)
(* =========================================================================================================== *)
(*so github would let me update my commit description*)







