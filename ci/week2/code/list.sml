(* introducing lists *)

(*

 [];

 [3,4,5];

 [4,5];

 [3,4,5,6];

 [(1+2),(3+4), 7];

 [true, false, true];

*)

(*  :: ~> cons  *)
val x = [3,4,5];

val x = 6::x;

val l = [6]::[[7,5], [6], [1,2,3]];

null [];

hd x;

tl l;

hd (tl l);


