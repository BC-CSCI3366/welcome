(* file: code.ml
 * author: Bob Muller
 * date: September 9, 2015
 *
 * Various helper functions for coding in OCaml.
 * compile as in:
 *
 * > ocamlfind ocamlc -thread -package universe -a -o code.cma code.ml

 Use the following if you don't define randomColor:

 * > ocamlfind ocamlc -thread -a -o code.cma code.ml
 *
open Color
open Assert

let randomColor () =
  let red   = Random.int 256 in
  let green = Random.int 256 in
  let blue  = Random.int 256
  in
  Color.make_color red green blue
*)
(* Abbreviations *)

let i2S = string_of_int
let i2F = float_of_int

let f2S = string_of_float
let f2I = int_of_float

let fmt = Printf.sprintf
let pfmt = Printf.printf

let (%) m n = m mod n
let pi = acos (-. 1.0)

let closeEnough ?(error=1e-6) a b = abs_float (a -. b) < error

let range n =
  let rec repeat n answer =
    match n = 0 with
    | true  -> answer
    | false ->
      let m = n - 1
      in
      repeat m (m :: answer)
  in
  repeat n []

let explode s =
  let n = String.length s in
  let rec repeat i =
    match i = n with
    | true  -> []
    | false -> s.[i] :: repeat (i + 1)
  in
  repeat 0

let implode chars =
  let res = Bytes.create (List.length chars) in
  let rec repeat i chars =
    match chars with
    | [] -> res
    | char :: chars ->
       Bytes.set res i char;
       repeat (i + 1) chars
  in
  Bytes.to_string (repeat 0 chars)


let run_test : string -> (unit -> bool) -> unit
  = Assert.run_test
