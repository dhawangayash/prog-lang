
(* count (3,6) => [3,4,5,6] *)
fun v1_count (from: int, to: int) =
		if from = to
		then to::[]
		else from :: v1_count(from+1, to)


fun v1_countup_from (x : int) =
		v1_count (1, x)
val res_v1_countup_from = v1_countup_from (7)

(* Better, but can do better :) *)
fun v2_countup_from (x : int) =
		let
				fun v2_count (from : int, to : int) =
						if from = to
					then to::[]
						else from::v2_count(from+1, to)
		in
				v2_count (1, x)
		end
val res_v2_countup_from = v2_countup_from (7)

(* using closures:: no need to pass to around since it's already in scope of outer
                    function count_from.x *)
fun countup_from_1_to (to : int) =
		let
				fun count (from : int) =
						if from = to
						then to::[]
						else from :: count (from+1)
		in
				count 1  (* This function available ONLY inside the scope of countup_from_1_to *)
		end
val res_v1_countup_from_1_to = countup_from_1_to 10
								
