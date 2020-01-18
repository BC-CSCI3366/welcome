(* file: main.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This is a hello world sort of app. Run it using dune as follows:

   > 
*)
module Code = Lib.Code

let _ = Code.pfmt "Welcome %s!\n" Sys.argv.(1)

(* Uncomment the definition of double below, you should see a red
   dot on the left. Repair the type error by replacing the float
   2.0 with the int 2 and the red dot should disappear.
*)
(*
let double n = n * 2.0
*)
