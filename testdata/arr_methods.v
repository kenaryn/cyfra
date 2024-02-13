fn main() {
    nums := [1,2,3,4,5,6]
    even := nums.filter(it % 2 == 0)
    println(even)
    fn_even := nums.filter(fn (x int) bool {
	return x % 2 == 0
    })
    println(fn_even)
}
