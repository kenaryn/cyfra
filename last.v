fn last<T>(a []T) ?T {
    if a.len == 0 {
	return none
    }
    return a[a.len-1]
}

fn maybe_print_last<T>(arr []T) ?T {
    // println(@LOCATION)
    if arr.len == 0 {
	println('none')
	return none
    }
    return last<T>(arr)
}

fn main() {
    a1 := []string{}
    // println(last(a1) or { 'none' })

    maybe_print_last(a1)
    println(maybe_print_last([8, -3, 4, 9, 5, 11])?)
    println(maybe_print_last(['hi', 'bye', 'good', 'wisdom', 'fate'])?)
}
