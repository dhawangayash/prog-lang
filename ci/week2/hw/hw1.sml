(* Homework1 SML Code *)

(* 
   Problem 1.
		int * int * int
		yyyy  mm    dd

		A "resonable" date has a positive year,
		a month between 1 and 12, AND
		a day no greater than 31 ( or less depending on the month)
*)
fun is_older (date_1 : int * int * int, date_2 : int * int * int) =
		if #1 date_1 = #1 date_2  (* if years are equal check months *)
		then
				if #2 date_1 = #2 date_2  (* if months are equal check day *)
				then #3 date_1 < #3 date_2
				else #2 date_1 < #2 date_2 
		else #1 date_1 < #2 date_2

(* 
   Problem 2:
		Write a function number_in_month that takes a list of dates and a
		month (i.e., an int) and returns how many dates in the list are in the
		given month.
*)
fun number_in_month (dates : (int * int * int) list, month : int) =
		if null dates
		then 0
		else
				if #2 (hd dates) = month
				then 1 + number_in_month (tl dates, month)
				else number_in_month (tl dates, month)

(* 
   Problem 3:
		Write a function number_in_months that takes a list of dates and a
		list of months (i.e., an int list) and returns the number of dates in
		the list of dates that are in any of the months in the list of
		months. Assume the list of months has no number repeated. Hint: Use
		your answer to the previous problem.
*)
fun number_in_months (dates : (int * int * int) list, months : int list) =
		if null months
		then 0
		else number_in_month (dates, hd months) + number_in_months (dates, tl months)


(* 
   Problem 4:
		Write a function dates_in_month that takes a list of dates and a month
		(i.e., an int) and returns a list holding the dates from the argument
		list of dates that are in the month. The returned list should contain
		dates in the order they were originally given.
	*)
fun dates_in_month (dates : (int * int  * int) list, month : int) =
		if null dates
		then []
		else
				let
						val result = dates_in_month (tl dates, month)
				in
					if #2 (hd dates) = month
					then hd dates :: result
					else result
				end

(* 
   Problem 5:
		Write a function dates_in_months that takes a list of dates and a
		list of months (i.e., an int list) and returns a list holding the
		dates from the argument list of dates that are in any of the months
		in the list of months. Assume the list of months has no number
		repeated. Hint: Use your answer to the previous problem and SML’s
		list-append operator (@).
*)
fun dates_in_months (dates : (int * int * int) list, months : int list) =
		if null months
		then []
		else
				let
						val res = dates_in_month (dates, hd months)
				in
						res @ dates_in_months (dates, tl months)
				end

(* 
 	  Problem 6: 
			Write a function get_nth that takes a list of strings and an int n and
			returns the nth element of the list where the head of the list is
			1st. Do not worry about the case where the list has too few elements:
			your function may apply hd or tl to the empty list in this case, which
			is okay.
*)
fun get_nth (strs : string list, n : int) =
		if n = 1
		then hd strs
		else get_nth(tl strs, n-1)

(* 
    Problem 7:
			Write a function date_to_string that takes a date and returns a string of the form 
      January 20, 2013 (for example). Use the operator ^ for concatenating
			strings and the library function Int.toString for converting an
			int to a string. For producing the month part, do not use a
			bunch of conditionals. Instead, use a list holding 12 strings
			and your answer to the previous problem. For consistency, put a
			comma following the day and use capitalized English month names:
			January, February, March, April, May, June, July, August,
			September, October, November, December.
*)
fun date_to_string (date : int * int * int) =
		let
				val month = #2 date
				val day = #3 date
				val year = #1 date
				val months_by_words = ["January", "February", "March",
												"April", "May", "June", "July", "August", "September",
												"October", "November", "December"]
		in
				get_nth (months_by_words, month) ^ " " ^ Int.toString day ^ ", " ^ Int.toString year
		end

(*
		Problem 8
			Write a function number_before_reaching_sum that takes an int
			called sum, which you can assume is positive, and an int list,
			which you can assume contains all positive numbers, and returns an
			int. You should return an int n such that the first n elements of
			the list add to less than sum, but the first n + 1 elements of the
			list add to sum or more. Assume the entire list sums to more than
			the passed in value; it is okay for an exception to occur if this
			is not the case.
*)
fun number_before_reaching_sum (sum : int, xs : int list) =
		if sum = 0 orelse sum < 0
		then ~1  (* You already over-reached, step back by one to get the exact point of inflection *)
		else 1 + number_before_reaching_sum(sum - hd xs, tl xs)

(*
	Problem 9:
		Write a function what_month that takes a day of year (i.e., an int
		between 1 and 365) and returns what month that day is in (1 for
		January, 2 for February, etc.). Use a list holding 12 integers and
		your answer to the previous problem.
*)
fun what_month (day_of_year : int) =
		let
				val months = [31,28,31,30,31,30,31,31,30,31,30,31]
		in
				1 + number_before_reaching_sum (day_of_year, months) (* add the current month into the current months *)
		end

(*
   Problem 10: 
		Write a function month_range that takes two days of the year day1 and day2 and returns an int list [m1,m2,...,mn],
    where m1 is the month of day1,
		      m2 is the month of day1+1, ...,
       and mn is the month of day day2.
    Note the result will have length day2 - day1 + 1 or length 0 if day1 > day2.
*)
fun month_range (day1 : int, day2 : int) =
		if day1 = day2
		then what_month day1 ::[]
		else if day1 > day2
		then []
		else what_month day1 :: month_range(day1 + 1, day2)

(*
   Problem 11:
		Write a function oldest that takes a list of dates AND evaluates to an (int*int*int) option.
    It evaluates to NONE if the list has no dates AND
                    SOME d if the date d is the oldest date in the list.
*)
fun oldest (dates : (int*int*int) list) =
		if null dates
		then NONE
		else let (* Using the classes example of better_max2 approach *)
						fun oldest_non_empty (dates: (int * int * int) list) =
								if null (tl dates)
								then hd dates
								else let val tl_result = oldest_non_empty (tl dates)
										 in
												 if is_older (hd dates, tl_result)
												 then hd dates
												 else tl_result
										 end
				in
						SOME (oldest_non_empty (dates))
				end
		

(*
  Problem 12:
	 Write functions number_in_months_challenge and
	 dates_in_months_challenge that are like your solutions to problems
	 3 and 5 except having a month in the second argument multiple times
	 has no more effect than having it once.
*)

(* The idea is to process remove the dates after they have been processed  *)
fun number_in_months_challenge (dates : (int * int * int) list, months : int list) =
		if null months
		then 0
		else let
				  fun removes_dates_of_month (dates: (int * int * int) list, month : int) =
							if null dates
							then []
							else if #2 (hd dates) = month
							then removes_dates_of_month (tl dates, month)
							else hd dates :: removes_dates_of_month (tl dates, month)
				 in
						 number_in_month (dates, hd months) + number_in_months_challenge (removes_dates_of_month (dates, hd months), tl months)
		     end

(* The idea is to process and to remove the dates after they have been processed. *)
fun dates_in_months_challenge (dates: (int * int * int) list, months : int list) =
		if null months
		then []
		else let
				    fun remove_dates_of_month (dates: (int * int * int) list, month : int) =
								if null dates
								then []
								else if #2 (hd dates) = month
								then remove_dates_of_month (tl dates, month)
								else hd dates :: remove_dates_of_month ( tl dates, month)
		     in
						 dates_in_month (dates, hd months) @ dates_in_months_challenge (remove_dates_of_month(dates, hd months), tl months)
		     end

(* 
  Problem 13:
		Write a function reasonable_date that takes a date and determines
		if it describes a real date in the common era. A “real date” has a
		positive year (year 0 did not exist), a month between 1 and 12,
		and a day appropriate for the month. Solutions should properly
		handle leap years. Leap years are years that are either divisible
		by 400 or divisible by 4 but not divisible by 100. (Do not worry
		about days possibly lost in the conversion to the Gregorian
		calendar in the Late 1500s.)
*)

