struct Abc {
    val string
}

struct Xyz {
    foo string
}

type Alphabet = Abc | Xyz

type Divisor = u16 | f32 | f64


fn main() {
    x := Alphabet(Xyz{'test'})
    // Check the type of a sum type
    if x is Abc {
	// Automatically converts `x` to `Abc` and can be used there.
	println(x)
    }
    if x !is Abc {
	println('Not Abc')
    }
    n := Divisor(u16(432))
    if n is u16 {
	println('n is of type ${typeof(n).name}')
    } else {
	println('not a u16')
    }

    m := Divisor(f32(4.32))
    //if m is f32 || m is f64 {
    if m.type_name() is f32 {
	println('m is a float')
    } else {
	println('m is NOT a float...')
    }

    match x {
	Abc {
	    println(x)
	}
	Xyz {
	    println('this is Xyz constructor\'s data type.')
	}
    }
    y := f32(4.32)
    if typeof(y).name as f32 {
	println('y is of float type!')
    }

}
