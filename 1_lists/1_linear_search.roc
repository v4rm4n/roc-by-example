## Linear Search
## ---
## Given an list of integers nums and an integer target,
## find the smallest index (0 based indexing) where the
## target appears in the list. If the target is not found
## in the list, return an error.

do_search = |nums, target, index| match nums {
	[] => Err(NotFound)
	[head, ..] if head == target => return Ok(index)
	[_, .. as tail] => do_search(tail, target, index + 1)
}

search : List(U64), U64 -> Try(U64, [NotFound])
search = |nums, target| {
	do_search(nums, target, 0)
}

main! = |_args| {
	nums = [1, 2, 3, 4, 5]
	result = search(nums, 3) |> Str.inspect
	echo!("${result}\n")
	Ok({})
}
