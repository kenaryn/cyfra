import math

fn div(x f64, y f64) f64 {
    return x / y
}

fn mod<T>(dividend T, divisor T) T {
    if divisor == 0 || math.is_inf(dividend, 0) || math.is_nan(dividend) || math.is_nan(divisor) {
	return math.nan()
    }

    if T.typ is_int()  {
	res := if dividend < divisor { dividend } else { math.floor(div(dividend, divisor)) }
    } else if T.typ is_float() {
	// math.fmod(dividend, divisor)
    } else if T.typ is string {
	eprintln('You may want to enter a numeral.')
    }

    return res
}

fn mod(dividend f64, divisor f64) f64 {
    if divisor == 0 || math.is_inf(dividend, 0) || math.is_nan(dividend) || math.is_nan(divisor) {
	return math.nan()
    }
    res := if dividend < divisor { dividend } else { math.floor(div(dividend, divisor)) }
    return int(res)
    //quotient := div(dividend, divisor)
    //// Remainder:
    //return (dividend / (divisor * quotient))
}

fn main() {
    n := mod(3, 2)	// '1'
    m := mod(2.0, 3.0)  // '2.0'
    println(n)
    println(m)
}
//match user_input
//  is int
//    println(mod(user_input)
//  is float
//    println(fmod(user_input))
//end
