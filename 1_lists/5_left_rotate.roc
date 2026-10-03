## Left Rotate Array by One
## ---
## Given an integer list `nums`, rotate the list to the left by one.

lr : List(U64) -> List(U64)
lr = |nums| match nums {
	[] => []
	[head, .. as tail] => List.append(tail, head)
}

main! = |_args| {
	nums = [8, 7, 8, 6, 5]
	result = lr(nums) |> Str.inspect
	echo!("${result}\n")
	Ok({})
}
