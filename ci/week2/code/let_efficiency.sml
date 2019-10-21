(* Programming Languagues: Oct 2019 *)

(* Section 1: Let Expressions to Avoid Repeated Computation *)

(* badly named: evaluates to 0 on empty list *)
fun bad_max (xs : int list) =
		if null xs
		then 0
		else if null (tl xs)
		then hd xs
		else if hd xs > bad_max (tl xs) (* too many recursion calls *)
		then hd xs
		else bad_max (tl xs) (* Unnecessarily calling way too many recursive calls *)

(* My solution, yeah baby *)
fun max (xs : int list) =
		if null xs
		then 0
		else
				let
						val x = hd xs
						val new_max = max(tl xs)
				in
						if x > new_max then x else new_max
				end
val res_max = max [1,200,3,4,5]
val res_max_test_case1 = max [1,200,3,4,5]
