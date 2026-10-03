## Second Largest
## ---
## Given an list of integers `nums`, return the second-largest element
## in the list. If the second-largest element does not exist, return `Err(Empty)`.

do_second = |nums, apex, apex2| match nums {
	[] => apex2
	[head, .. as tail] => {
		if head > apex {
			do_second(tail, head, apex)
		} else if head < apex and (head > apex2 or apex2 == apex) {
			do_second(tail, apex, head)
		} else {
			do_second(tail, apex, apex2)
		}
	}
}

second_largest : List(U64) -> Try(U64, [Empty])
second_largest = |nums| match nums {
	[] => Empty |> Err
	[first] => Ok(first)
	[first, second, .. as tail] => do_second(tail, U64.max(first, second), U64.min(first, second)) |> Ok
}

main! = |_args| {
	nums = [8, 7, 8, 6, 5]
	result = second_largest(nums) |> Str.inspect
	echo!("${result}\n")
	Ok({})
}
