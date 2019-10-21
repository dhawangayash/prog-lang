
(* code as seen in class *)

(* Variable binding *)
val x = 2

val y = 3


(* Intro to lists *)

val list = [] 

fun append (xs, ys) =
		if null xs
		then ys
		else (hd xs):: append(tl xs, ys)

