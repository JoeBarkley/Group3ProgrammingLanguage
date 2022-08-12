(* =========================================================================================================== *)
structure Semantics =
struct


(* This makes contents of the Model structure directly accessible (i.e., the prefix "Model." is not needed. *)            
open Model; 
            
(* This makes the internal representation of parse trees directly accessible. *)            
open CONCRETE_REPRESENTATION;

(* The following tree structure, defined in the CONCERETE_REPRESENTATION structure, is used in the TL System:

    datatype NODE_INFO = info of { id : IntInf.int, line : int * int , column : int * int, label : string };
	datatype INODE = inode of string * NODE_INFO
	                 | ...  
															
	datatype ITREE = itree of INODE * ITREE list;
*)


(* =========================================================================================================== *)
(* Here is where you add the M and E (as well as any other) definitions you developed in M2. The primary challenge here
   is to translate the parse expression notation we used in M2 to the actual SML tree patterns used in the TL System. 
   
   Example:
   
   M1: <stmtList> ::= <stmt> ";" <stmList>
   
   M2: M( [[ stmt_1 ; stmtList_1 ]], m) = M(stmtList_1, M(stmt_1,m))
    
   M4: 
        M( itree(inode("stmtList",_),
                    [
                        stmt,       (* this is a regular variable in SML and has no other special meaning *)
                        semiColon,  (* this is a regular variable in SML and has no other special meaning *)
                        stmtList    (* this is a regular variable in SML and has no other special meaning *) 
                    ]
                ),
           m
           
        ) = M( stmtList, M(stmt, m) )  
        
        
        Note that the above M4 implementation will match ANY tree whose root is "stmtList" having three children.
        Such matches can be further constrained by explicitly exposing more of the tree structure.
        
        M( itree(inode("stmtList",_),
                    [
                        stmt,                       (* this is a regular variable in SML and has no other special meaning *)
                        itree(inode(";",_), [] ),   (* A semi-colon is a leaf node. All leaf nodes have an empty children list. *)
                        
                        stmtList                    (* this is a regular variable in SML and has no other special meaning *) 
                    ]
                ),
           m
           
        ) = M( stmtList, M(stmt, m) )  
        
        Note that the above M4 implementation will match ANY tree satisifying the following constraints:
            (1) the root is "stmtList"
            (2) the root has three children
            (3) the second child is a semi-colon   
*)

fun M(  itree(inode("program",_), 
                [ 
                    stmt_list
                ] 
             ), 
        m
    ) = M(stmt_list, m)
	
  | M(  itree(inode("stmtList",_),
        [
            stmt1,
            itree(inode(";",_),[]),
            stmtList1
        ]
    ), m0) = let
                val m1 = M(stmt1,m0)
            in
                M(stmtList1,m1)
            end
            
(*semantics for assignStmt of form "identifier = expression"*)
  | M(  itree(inode("assignStmt",_),
        [
            identifier,
            itree(inode("=",_),[]),
            expression1
        ]
    ), m) = let
                val (v,m1) = E'(expression1,m0)
                val loc = getLoc(accessEnv(identifier,m1))
            in
                updateStore(loc,v,m1)
            end
            
(*semantics for assignStmt of form "int identifier = expression"*)
  | M(  itree(inode("assignStmt",_),
        [
            itree(inode("int",_),[]),
            identifier,
            itree(inode("=",_),[]),
            expression1
        ]
    ), m) = let
                val m1 = updateEnv(identifier,int,m)
                val (v,m2) = E'(expression1,m1)
                val loc = getLoc(accessEnv(identifier,m2))
            in
                updateStore(loc,v,m2)
            end
            
(*semantics for assignStmt of form "bool identifier = expression"*)
  | M(  itree(inode("assignStmt",_),
        [
            itree(inode("bool",_),[]),
            identifier,
            itree(inode("=",_),[]),
            expression1
        ]
    ), m) = let
                val m1 = updateEnv(identifier,bool,m)
                val (v,m2) = E'(expression1,m0)
                val loc = getLoc(accessEnv(identifier,m2))
            in
                updateStore(loc,v,m2)
            end
            
(*semantics for decStmt of form "int identifier"*)
  | M(  itree(inode("decStmt",_),
        [
            itree(inode("int",_),[]),
            identifier
        ]
    ), m) = updateEnv(identifier,int,m)
    
(*semantics for decStmt of form "bool identifier"*)
  | M(  itree(inode("decStmt",_),
        [
            itree(inode("bool",_),[]),
            identifier
        ]
    ), m) = updateEnv(identifier,bool,m)
    
(*semantics for block*)
  | M(  itree(inode("block",_),
        [
            itree(inode("{",_),[]),
            stmtList1,
            itree(inode("}",_),[])
        ]
    ), (env0,loc0,s0)) = let
                            val (env1,loc1,s1) = M(stmtList1,(env0,loc0,s0))
                         in
                            (env0,loc1,s1)
                         end
                         
(*semantics for condStmt of form "if (expression) block"*)
  | M(  itree(inode("condStmt",_),
        [
            itree(inode("if",_),[]),
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[]),
            block1
        ]
    ), m0) = let
                val (v,m1) = E'(expression1,m0)
             in
                if v then M(block1,m1)
                else m1
             end
             
(*semantics for condStmt of form "if (expression) block else block"*)
  | M(  itree(inode("condStmt",_),
        [
            itree(inode("if",_),[]),
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[]),
            block1,
            itree(inode("else",_),[]),
            block2
        ]
    ), m0) = let
                val (v,m1) = E'(expression1,m0)
             in
                if v then M(block1,m1)
                else M(block2,m1)
             end
             
(*semantics for while loop*)
  | M(  itree(inode("whileLoop",_),
        [
            itree(inode("while",_),[]),
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[]),
            itree(inode("{",_),[]),
            block1,
            itree(inode("}",_),[])
        ]
    ), m0) = let
                val (v,m1) = E'(expression1,m0)
             in
                if v then
                    let
                        val m2 = M(block1,m1)
                    in
                        M(  itree(inode("whileLoop",_),
                            [
                                itree(inode("while",_),[]),
                                itree(inode("(",_),[]),
                                expression1,
                                itree(inode(")",_),[]),
                                itree(inode("{",_),[]),
                                block1,
                                itree(inode("}",_),[])
                            ]
                        ), m2)
                    end
                else m1
             end
             
(*semantics for for loop*)
  | M(  itree(inode("forLoop",_),
        [
            itree(inode("for",_),[]),
            itree(inode("(",_),[]),
            assignStmt1,
            itree(inode(";",_),[]),
            termination1,
            itree(inode(";",_),[]),
            decoratedId1,
            itree(inode(")",_),[]),
            block1
        ]
    ), m0) = let
                val m1 = M(assignStmt1,m0)
             in
                N(termination1,decoratedId1,block1,m1)
             end
             
(*semantics for print statement*)
  | M(  itree(inode("printStmt",_),
        [
            itree(inode("print",_),[]),
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[])
        ]
    ), m0 = let
                val (v,m1) = E'(expression1,m0)
            in
                m1
            end

  | M(  itree(inode(x_root,_), children),_) = raise General.Fail("\n\nIn M root = " ^ x_root ^ "\n\n")
  
  | M _ = raise Fail("error in Semantics.M - this should never occur");
  
(*evaluation for termination*)
fun E'( itree(inode("termination",_),
        [
            expression1
        ]
    ), m) = E'(expression1,m)
 
(*evaluation for decorated id of form "++decoratedId"*)
|   E'( itree(inode("decoratedId",_),
        [
            itree(inode("++",_),[]),
            identifier
        ]
    ), m0) = let
                val loc = getLoc(accessEnv(identifier,m0)
                val v1 = accessStore(loc,m0)
                val v2 = (v1+1)
                val m1 = updateStore(loc,v2,m0)
             in
                (v2,m1)
             end
             
(*evaluation for decorated id of form "--decoratedId"*)
|   E'( itree(inode("decoratedId",_),
        [
            itree(inode("--",_),[]),
            identifier
        ]
    ), m0) = let
                val loc = getLoc(accessEnv(identifier,m0)
                val v1 = accessStore(loc,m0)
                val v2 = (v1-1)
                val m1 = updateStore(loc,v2,m0)
             in
                (v2,m1)
             end
             
(*evaluation for decorated id of form "decoratedId++"*)
|   E'( itree(inode("decoratedId",_),
        [
            identifier,
            itree(inode("++",_),[])
        ]
    ), m0) = let
                val loc = getLoc(accessEnv(identifier,m0)
                val v1 = accessStore(loc,m0)
                val v2 = (v1+1)
                val m1 = updateStore(loc,v2,m0)
             in
                (v1,m1)
             end
             
(*evaluation for decorated id of form "decoratedId++"*)
|   E'( itree(inode("decoratedId",_),
        [
            identifier,
            itree(inode("--",_),[])
        ]
    ), m0) = let
                val loc = getLoc(accessEnv(identifier,m0)
                val v1 = accessStore(loc,m0)
                val v2 = (v1-1)
                val m1 = updateStore(loc,v2,m0)
             in
                (v1,m1)
             end
             
(*evaluation for generic expression*)
|   E'( itree(inode("expression",_),
        [
            logicalExp1
        ]
    ), m) = E'(logicalExp1,m)
    
(*evaluation for logical expression of form "logicalExpression or logicalTerm"*)
|   E'( itree(inode("logicalExp",_),
        [
            logicalExp1,
            itree(inode("or",_),[]),
            logicalTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(logicalExp1,m0)
                val (v2,m2) = E'(logicalTerm1,m1)
             in
                if v1 then (true,m2)
                else if v2 then (true,m2)
                else (false,m2)
             end
  
(*evaluation for logical expression of form "logicalTerm"*)
|   E'( itree(inode("logicalExp",_),
        [
            logicalTerm1
        ]
    ), m) = E'(logicalTerm1,m)
    
(*evaluation for logical term of form "logicalTerm and relationalExp"*)
|   E'( itree(inode("logicalTerm",_),
        [
            logicalTerm1,
            itree(inode("and",_),[]),
            relationalExp1
        ]
    ), m0) = let
                val (v1,m1) = E'(logicalTerm1,m0)
                val (v2,m2) = E'(relationalExp1,m1)
             in
                if v1 andalso v2 then (true,m2)
                else (false,m2)
             end

(*evaluation for logical term of form "relationalExp"*)
|   E'( itree(inode("logicalTerm",_),
        [
            relationalExp1
        ]
    ), m) = E'(relationalExp1,m)

(*evaluation for relational expression of form "relationalExp == arithmeticExp"*)
|   E'( itree(inode("relationalExp",_),
        [
            relationalExp1,
            itree(inode("==",_),[]),
            arithmeticExp1
        ]
    ), m0) = let
                val (v1,m1) = E'(relationalExp1,m0)
                val (v2,m2) = E'(arithmeticExp1,m1)
             in
                if v1 = v2 then (true,m2)
                else (false,m2)
             end
             
(*evaluation for relational expression of form "relationalExp != arithmeticExp"*)
|   E'( itree(inode("relationalExp",_),
        [
            relationalExp1,
            itree(inode("!=",_),[]),
            arithmeticExp1
        ]
    ), m0) = let
                val (v1,m1) = E'(relationalExp1,m0)
                val (v2,m2) = E'(arithmeticExp1,m1)
             in
                if v1 <> v2 then (true,m2)
                else (false,m2)
             end
             
(*evaluation for relational expression of form "relationalExp > arithmeticExp"*)
|   E'( itree(inode("relationalExp",_),
        [
            relationalExp1,
            itree(inode(">",_),[]),
            arithmeticExp1
        ]
    ), m0) = let
                val (v1,m1) = E'(relationalExp1,m0)
                val (v2,m2) = E'(arithmeticExp1,m1)
             in
                if v1 > v2 then (true,m2)
                else (false,m2)
             end
             
(*evaluation for relational expression of form "relationalExp < arithmeticExp"*)
|   E'( itree(inode("relationalExp",_),
        [
            relationalExp1,
            itree(inode("<",_),[]),
            arithmeticExp1
        ]
    ), m0) = let
                val (v1,m1) = E'(relationalExp1,m0)
                val (v2,m2) = E'(arithmeticExp1,m1)
             in
                if v1 < v2 then (true,m2)
                else (false,m2)
             end
             
(*evaluation for relational expression of form "arithmeticExp"*)
|   E'( itree(inode("relationalExp",_),
        [
            arithmeticExp1
        ]
    ), m) = E'(arithmeticExp1,m)
    
(*evaluation for arithmetic expression of form "arithmeticExp + arithmeticTerm"*)
|   E'( itree(inode("arithmeticExp",_),
        [
            arithmeticExp1,
            itree(inode("+",_),[]),
            arithmeticTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(arithmeticExp1,m0)
                val (v2,m2) = E'(arithmeticTerm1,m1)
             in
                ((v1+v2),m2)
             end
             
(*evaluation for arithmetic expression of form "arithmeticExp - arithmeticTerm"*)
|   E'( itree(inode("arithmeticExp",_),
        [
            arithmeticExp1,
            itree(inode("-",_),[]),
            arithmeticTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(arithmeticExp1,m0)
                val (v2,m2) = E'(arithmeticTerm1,m1)
             in
                ((v1-v2),m2)
             end
             
(*evaluation for arithmetic expression of form "arithmeticTerm"*)
|   E'( itree(inode("arithmeticExp",_),
        [
            arithmeticTerm1
        ]
    ), m) = E'(arithmeticTerm1,m)
    
(*evaluation for arithmetic term of form "arithmeticTerm * arithmeticEntry"*)
|   E'( itree(inode("arithmeticTerm",_),
        [
            arithmeticTerm1,
            itree(inode("*",_),[]),
            arithmeticEntry1
        ]
    ), m0) = let
                val (v1,m1) = E'(arithmeticTerm1,m0)
                val (v2,m2) = E'(arithmeticEntry1,m1)
             in
                ((v1*v2),m2)
             end
            
(*evaluation for arithmetic term of form "arithmeticTerm / arithmeticEntry"*)
|   E'( itree(inode("arithmeticTerm",_),
        [
            arithmeticTerm1,
            itree(inode("/",_),[]),
            arithmeticEntry1
        ]
    ), m0) = let
                val (v1,m1) = E'(arithmeticTerm1,m0)
                val (v2,m2) = E'(arithmeticEntry1,m1)
             in
                ((v1 div v2),m2)
             end

(*evaluation for arithmetic term of form "arithmeticTerm % arithmeticEntry"*)
|   E'( itree(inode("arithmeticTerm",_),
        [
            arithmeticTerm1,
            itree(inode("%",_),[]),
            arithmeticEntry1
        ]
    ), m0) = let
                val (v1,m1) = E'(arithmeticTerm1,m0)
                val (v2,m2) = E'(arithmeticEntry1,m1)
             in
                ((v1 mod v2),m2)
             end
             
(*evaluation for arithmetic term of form "arithmeticEntry"*)
|   E'( itree(inode("arithmeticTerm",_),
        [
            arithmeticEntry1
        ]
    ), m) = E'(arithmeticEntry1,m)
    
(*evaluation for arithmetic entry of form "-exponentTerm"*)
|   E'( itree(inode("arithmeticEntry",_),
        [
            itree(inode("-",_),[]),
            exponentTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(exponentTerm1,m0)
             in
                (~v1,m1)
             end
             
(*evaluation for arithmetic entry of form "not exponentTerm"*)
|   E'( itree(inode("arithmeticEntry",_),
        [
            itree(inode("not",_),[]),
            exponentTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(exponentTerm1,m0)
             in
                (not v1,m1)
             end
             
(*evaluation for arithmetic entry of form "exponentTerm"*)
|   E'( itree(inode("arithmeticEntry",_),
        [
            exponentTerm1
        ]
    ), m) = E'(exponentTerm1,m)
    
(*evaluation for exponent term of form "baseTerm ^ exponentTerm"*)
|   E'( itree(inode("exponentTerm",_),
        [
            baseTerm1,
            itree(inode("^",_),[]),
            exponentTerm1
        ]
    ), m0) = let
                val (v1,m1) = E'(exponentTerm1,m0)
                val (v2,m2) = E'(baseTerm1,m1)
             in
                (exp(v2,v1),m2)
             end
             
(*evaluation for exponent term of form "baseTerm"*)
|   E'( itree(inode("exponentTerm",_),
        [
            baseTerm1
        ]
    ), m) = E'(baseTerm1,m)
    
(*evaluation for base term of form "(expression)"*)
|   E'( itree(inode("baseTerm",_),
        [
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[])
        ]
    ), m) = E'(expression1,m)
    
(*evaluation for base term of form "abs(expression)"*)
|   E'( itree(inode("baseTerm",_),
        [
            itree(inode("abs",_),[]),
            itree(inode("(",_),[]),
            expression1,
            itree(inode(")",_),[])
        ]
    ), m0) = let
                val (v1,m1) = E'(expression1,m0)
             in
                if v1 < 0 then (~v1,m1)
                else (v1,m1)
             end
             
(*evaluation for base term of form "identifier"*)
|   E'( itree(inode("baseTerm",_),
        [
            identifier
        ]
    ), m) = let
                val loc = getLoc(accessEnv(identifier,m))
                val v = accessStore(loc,m)
            in
                (v,m)
            end
            
(*evaluation for base term of form "integer"*)
|   E'( itree(inode("baseTerm",_),
        [
            integer
        ]
    ), m) = (integer,m)
    
(*evaluation for base term of form "boolean"*)
|   E'( itree(inode("baseTerm",_),
        [
            boolean
        ]
    ), m) = (boolean,m)
    
(*evaluation for base term of form "decoratedId"*)
|   E'( itree(inode("baseTerm",_),
        [
            decoratedId
        ]
    ), m) = E'(decoratedId,m);

(*helper function for for loop*)
fun N(termination1,decoratedId1,block1,m0) =
    let
        val (v1,m1) = E'(termination1,m0)
    in
        if v1 then
            let
                val (v2,m2) = E'(decoratedId1,m1)
                val m3 = M(block1,m2)
            in
                N(termination1,decoratedId1,block1,m3)
            end
        else m1
    end;

(* =========================================================================================================== *)
end (* struct *)
(* =========================================================================================================== *)








