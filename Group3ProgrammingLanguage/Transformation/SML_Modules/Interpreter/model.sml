(* =========================================================================================================== *)
structure Model =

struct 

(* =========================================================================================================== *)
(* This function may be useful to get the leaf node of a tree -- which is always a string (even for integers).
   It is up to the interpreter to translate values accordingly (e.g., string to integer and string to boolean).
   
   Consult (i.e., open Int and open Bool) the SML structures Int and Bool for functions that can help with 
   this translation. 

fun getLeaf( term ) = CONCRETE.leavesToStringRaw term 
*)
fun getLeaf( term ) = CONCRETE.leavesToStringRaw term 
(* For your typeChecker you may want to have a datatype that defines the types 
  (i.e., integer, boolean and error) in your language. *)
datatype types = INT | BOOL | ERROR;


(* It is recommended that your model store integers and Booleans in an internal form (i.e., as terms belonging to
   a userdefined datatype (e.g., denotable_value). If this is done, the store can be modeled as a list of such values.
*)
datatype denotable_value =  Boolean of bool 
                          | Integer of int;


type loc   = int
type env   = (string * types * loc) list
type store = (loc * denotable_value) list


(* The model defined here is a triple consisting of an environment, an address counter, and a store. The environment
   and the store are lists similar to what we have used in class. The address counter serves as an implementation of
   new(). Note that, depending on your implementation, this counter either contains the address of (1) the
   next available memory location, or (2) the last used memory location -- it all depends on when the counter is 
   incremented. *)
val initialModel = ( []:env, 0:loc, []:store )

fun getStoreFromModel (env,s) = s;
fun getEnvFromModel   (env,s) = env;

exception runtime_error;

fun error msg = (print msg; raise runtime_error);

fun length[]        = 0
  | length (x::xs)  = 1 + length xs;

fun accessEnv(id1,(env,ctr,s)) =
    let
        val msg = "Error: accessEnv " ^ id1 ^ " not found.";
        
        fun aux [] = error msg
          | aux ((id,t,loc)::env) =
            if id1 = id then (t,loc)
            else aux env;
    in
        aux env
    end;
    
fun accessStore(loc1,(env,ctr,s)) =
    let
        val msg = "Error: accessStore " ^ Int.toString loc1 ^ " not found.";
        
        fun aux [] = error msg
          | aux ((loc,dv)::s) =
            if loc1 = loc then dv
            else aux s;
    in
        aux s
    end;
	
fun updateEnv(id,t,([],ctr,s))	= ([(id,t,ctr)],ctr+1,s)
  | updateEnv(id,t,(env,ctr,s))	= 
        let
            fun aux(id,t,[])            = [(id,t,ctr)]
              | aux(id,t,envElem::env)  =
                    let
                        val (id1,t1,loc1) = envElem
                        val matchFound = id1 = id
                    in
                        if matchFound then (id,t,loc1) :: env
                        else envElem::aux(id,t,env)
                    end
			val origLength = length(env)
			val newEnv = aux(id,t,env)
			val newLength = length(newEnv)
        in
            if newLength > origLength then (newEnv,ctr+1,s) else (newEnv,ctr,s)
        end ;
	
fun updateStore(loc,dv,(env,ctr,[])) = (env,ctr,[(loc,dv)])
  | updateStore(loc,dv,(env,ctr,s))  = 
            let
                fun aux(loc,dv,[]) = [(loc,dv)]
                  | aux(loc,dv,sElem::s) = 
                        let
                                val (loc1,dv1) = sElem
                                val matchFound = loc1 = loc
                        in
                                if matchFound then (loc,dv) :: s
                                else sElem::aux(loc,dv,s)
                        end
            in
                (env,ctr,aux(loc,dv,s))	
            end;
  
fun getLoc(t,loc) = loc;

fun getType(t,loc) = t; 

(* =========================================================================================================== *)
end; (* struct *) 
(* =========================================================================================================== *)