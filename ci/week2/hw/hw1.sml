(* Homework1 SML Code *)

(* 

   int * int * int 
   yyyy  mm    dd 
   
  A "resonable" date has a positive year, 
  a month between 1 and 12, AND
  a day no greater than 31 ( or less depending on the month) 

*)

fun is_older (date_1 : int * int * int, date_2 : int * int * int) =
		(* 
       if year is smaller return true
			 if year is equal 
			 then if month is equal
			 			then date check
						else false
		*)

		if #1 date_1 = #1 date_2  (* if years are equal check months *)
		then
				if #2 date_1 = #2 date_2  (* if months are equal check day *)
				then #3 date_1 < #3 date_2
				else #2 date_1 < #2 date_2 
		else #1 date_1 < #2 date_2

