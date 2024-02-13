module main
// This package is a very basic calculator which encourages reverse polish notation.
// TODO: 1. add export/save function to save the history in a external file.
// TODO: 2. refactor list of cmd in a enum and match it agaist a map, which is then passed to a function in order to evaluate user input.
// TODO: 3. add `-h` flag to print help outside the program with `flag` module.
// TODO: 4. format properly statistical results within the same column width.
// TODO: 5. fix modulo function as it currently returns a wrong result, see: 2 % 4 = 1 in stead of 2
// TODO: 6. parse whitespace to avoid truncations like `2 4` that returns only `2`
import os
import math
import time
import util

//struct Operation {
//    id string
//    name string
//    sign [1]u8
//}

struct Logbook {
mut:
    entries []string
}

fn add(x f64, y f64) f64 {
    return x + y
}

fn sub(x f64, y f64) f64 {
    return x - y
}

fn mul(x f64, y f64) f64 {
    return x * y
}

fn div(x f64, y f64) f64 {
    return x / y
}

fn mod(dividend f64, divisor f64) f64 {
    if divisor == 0 || math.is_inf(dividend, 0) || math.is_nan(dividend) || math.is_nan(divisor) {
	return math.nan()
    }
    res := if dividend < divisor { dividend } else { int(math.floor(dividend / divisor)) }
    quotient := div(dividend, divisor)
    // Remainder:
    return (dividend / (divisor * quotient))
}

fn main() {
    // Measure the time spent on Cyfra for statistical purposes.
    sw := time.new_stopwatch()

    println('Welcome to cyfra!')  // digit, number, figure, numeral, cipher/cypher in Polish.
    // Anonymous function for callback to a default value when the user input in incorrect.
    mut func := fn (_ f64, _ f64) f64 {
	return 0
    }
    mut op_sign := ''
    mut history := []string{}
    mut res := ''
    mut cmd_count := u16(0)

    for {
	op_choice := os.input('Enter an operation: ').trim_space()

	//match op_choice {
    	//    'add', '+' {
    	//        func = add
    	//        op_sign = '+'
	//	cmd_count++
    	//    }
    	//    'sub', '-' {
    	//        func = sub
    	//        op_sign = '-'
	//	cmd_count++
    	//    }
    	//    'mul', '*', '×' {
    	//        func = mul
    	//        op_sign = '×'
	//	cmd_count++
    	//    }
    	//    'div', '/', '÷' {
    	//        func = div
    	//        op_sign = '÷'
	//	cmd_count++
    	//    }
	//    'mod', '%' {
	//	func = mod
	//	//func = if x is f32 { fmod } else { mod }
	//	op_sign = '%'
	//	cmd_count++
	//    }
	//    '_hist' {
	//	util.print_history(history)
	//	continue
	//    }
	//    'help' {
	//	util.print_help(util.valid_op, util.special_cmd)
	//	continue
	//    }
	//    '_stat' {
	//	t_elapsed := util.time_elapsed(sw)
	//	util.get_stat(mut &history, t_elapsed, cmd_count)
	//	continue
	//    }
	//    'exit', 'quit' {
	//	println('Exiting Cyfra.')
	//	exit(0)
	//    }
    	//    else {
	//	func(0.0, 0.0)
	//	eprintln('\'$op_choice\' is not a valid operation.')
	//	continue
	//    }
	//}

	op := util.generate_computation(kind: op_choice)

    	x := os.input('Enter a first value: ').f64()
    	y := os.input('Enter a second value: ').f64()

	comp := op(x, y)

    	//op := func(x, y)
	res = '$x $y $op_sign = $op'
	println(res)
	history.prepend(res)
    }

    exit(0)
}

fn init() {
    // Invokes the console codes to clear out the console's output and position the cursor
    // at the top left of the screen.
    println('\e[2J\e[1;1H')
}
