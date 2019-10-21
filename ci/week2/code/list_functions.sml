fun sum_list (xs : int list) =
		if null xs
		then 0
		else hd xs + sum_list(tl xs)

fun list_product (xs : int list) =
		if null xs
		then 1
		else hd xs * list_product(tl xs)
val x = list_product[];   (* 1 *)
val y = list_product [5]; (* 5 *)
val z = list_product [2,4,2];  (* 16 *)


fun countdown (x : int) = (* [7, 6, 5, 4, 3, 2, 1] *)
		if x = 0
		then []
		else x :: countdown(x-1)
val test_countdown = countdown(7)

fun append (xs : int list, ys : int list) =
		if null xs
		then ys
		else hd xs :: append(tl xs, ys)
val test_append = append([1,2,3], [4,5,6])

(* sum *)
fun sum_pair_list (xs : (int * int) list) =
		if null xs
		then 0
		else #1 (hd xs) + #2 (hd xs) + sum_pair_list (tl xs)
(* you cannot test a function call without returning the result back to a variable such as given below 
   If you just call sum_pair_list [(1,2), (3,4)] it would fail you need to assign that result back to 
   a function *)
val res = sum_pair_list [(1,2),(3,4)]


(* firsts 
    i/o:  [(3,4), (5,6)]
    o/p:  [3,5]
*)
fun firsts (xs : (int * int) list) =
		if null xs
		then []
		else #1 (hd xs) :: firsts(tl xs)
val firsts_result = firsts [(3,4), (5,6)]
				
(* seconds 
    i/o:  [(3,4), (5,6)]
    o/p:  [4,6]
*)
fun seconds (xs : (int * int) list) =
		if null xs
		then []
		else #2 (hd xs) :: seconds(tl xs)
val seconds_result = seconds [(3,4), (5,6)]

fun sum_pair_list2 (xs : (int * int) list) =
		sum_list(firsts xs) + sum_list(seconds xs)
val test_sum_pair_list2 = sum_pair_list2 [(1,2),(3,4)]


fun factorial (n : int) =
		if n = 0
		then 1
		else n * factorial (n-1)
val test_factorial = factorial 5

fun factorial_2 (n : int) = list_product(countdown n)
val test_factorial = factorial_2(5)

