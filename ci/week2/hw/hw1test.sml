(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test1 = is_older ((1,2,3),(2,3,4)) = true
val test12 = is_older ((1,2,3),(1,1,4)) = false
val test13 = is_older ((2,2,3),(1,1,4)) = false
val test14 = is_older ((1,2,3),(1,2,4)) = true

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test21 = number_in_month ([(2012,2,28),(2013,2,29),(2015,2,1)],2) = 3
val test22 = number_in_month ([(2012,1,28),(2013,2,29),(2015,2,1)],1) = 1

val test3 = number_in_months ([(2013,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test12 = number_in_months_challenge ([(2013,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,33,4,5,1,2,3,4,5,12,12,12]) = 4


val test12_1 = dates_in_months_challenge ([(2013,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,33,4,5,1,2,3,4,5,12,12,12]) = [(2013,2,28),(2011,4,28),(2011,3,31),(2013,12,1)] 


val test13 = resonable_date ((2013,2,28)) = true
val test13_1 = resonable_date ((2013,2,28)) = true
val test13_2 = resonable_date ((~123,2,28)) = false
val test13_3 = resonable_date ((2012,2,29)) = true
