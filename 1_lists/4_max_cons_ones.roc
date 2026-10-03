## Maximum Consecutive Ones
## ---
## Given a binary list nums, return the maximum number of consecutive 1s in the list.
## A binary list is an list that contains only 0s and 1s.

do_mco = |nums, cur, max| match nums {
	[] => U64.max(cur, max)
	[head, .. as tail] => {
		if head == 1 {
			do_mco(tail, cur + 1, max)
		} else {
			if cur > max {
				do_mco(tail, 0, cur)
			} else {
				do_mco(tail, 0, max)
			}
		}
	}
}

mco : List(U64) -> Try(U64, [Empty])
mco = |nums| match nums {
	[] => Empty |> Err
	_ => do_mco(nums, 0, 0) |> Ok
}

main! = |_args| {
	nums = [1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1]
	result = mco(nums) |> Str.inspect
	echo!("${result}\n")
	Ok({})
}
