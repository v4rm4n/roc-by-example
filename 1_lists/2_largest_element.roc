## Largest Element
## ---
## Given an list of integers `nums`, return the value
## of the largest element in the list.

find_largest = |nums, apex| match nums {
	[] => apex
	[head, .. as tail] => {
		if head > apex {
			find_largest(tail, head)
		} else {
			find_largest(tail, apex)
		}
	}
}

largest : List(U64) -> Try(U64, [Empty])
largest = |nums| match nums {
	[] => Err(Empty)
	[head, .. as tail] => Ok(find_largest(tail, head))
}

main! = |_args| {
	nums = [24, 41, 42, 12, 74, 12, 32]
	result = largest(nums) |> Str.inspect
	echo!("${result}\n")
	Ok({})
}
