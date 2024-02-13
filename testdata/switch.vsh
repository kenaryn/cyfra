#!/usr/bin/env -S v
//module switch_test

//import os

//fn main() {
    for {
    res := input('Enter an option: ')
	match res {
    	    'help' {
    	        println('Help is coming pretty soon!')
    	    }
	    'exit', 'quit' {
		exit(0)
	    }
    	    else {
    	        //if res[0].is_digit() || res.contains_only('0123456789') {
		if res.contains_any('0123456789') {
		    println('Enter an operation at first.')
		    continue
    	        }
    	        else {
		    println('It is not a valid operation.')
		    continue
    	        }
    	    }
    	}
    }
//}

// in `string` module:
// parse_int()
// is_digit()
// contains_only()
// contains_any()
