module util

import time

pub const (
    valid_op = ['add', 'sub', 'mul', 'div', 'mod']
    special_cmd = ['_stat', 'help', '_hist']

    // Facilitates the string's conversion into the Operations enum.
    operations_map = {
	'add': Operations.add
	'+':   Operations.add
	'sub': Operations.sub
	'-':   Operations.sub
	'mul': Operations.mul
	'×':   Operations.mul
	'div': Operations.div
	'÷':   Operations.div
	'mod': Operations.mod
	'%':   Operations.mod
    }
    allowed_operations = operations_map.keys()
)

pub enum Operations {
    add
    sub
    mul
    div
    mod
    _stat
    _hist
    exit
}

pub struct Computations {
    kind Operations
    operands [2]int
    counter u16
}

pub fn generate_computation(op Computations) string {
    return match op.kind {
	.add { add }
	.sub { sub }
	.mul { mul }
	.div { div }
	.mod { if op.operands[0] is int { mod } else { fmod }
	._stat { get_stat(mut &history, t_elapsed, cmd_count) }
        //._hist { print_history(history) }
	//.exit { exit(0) }
    }
}

// print_help prints all the available operations for the user.
pub fn print_help(valid_op []string, special_cmd []string) {
    print('Here are all the possible operations: ' +
    '${valid_op.join(', ')}\n' +
    'Try out special commands: ' +
    '${special_cmd.join(', ')}\n')
}

// print_history prints the history of all the executed commands in reverse order.
pub fn print_history(history []string) {
    if history.len > 0 {
	for computation in history {
	    println('\t$computation')
	}
    } else {
	println('There is no history yet.')
    }
}

// pluralize formats the resulting time elapsed of the eponym function.
fn pluralize(amount u32, single string, many string, mut res []string) {
    if amount <= 1 {
	res << '$amount $single'
    } else if amount > 1 {
	res << '$amount $many'
    }
}

fn last<T>(arr []T) ?T {
    if arr.len == 0 {
	return none
    }
    return arr[0]
}

// get_stat prints some minor statistics regarding to user's usage of the program.
pub fn get_stat(mut history []string, t_elapsed string, cmd_count u16) {
    mut last_cmd := if history.len > 0 { history.first() } else { 'none' }

    println('\n------ Statistics ------\n' +
	'Last command: $last_cmd\n' +
	'Total number of commands: $cmd_count\n' +
	'Running Cyfra for: $t_elapsed')
}

// time_elapsed returns the amount of time in seconds, minutes and hours spent when called `_stat`.
pub fn time_elapsed(sw time.StopWatch) string {
    mut seconds := u32(sw.elapsed().seconds())
    mut minutes := u32(0)
    mut hours := u32(0)
    mut res := []string{}

    match true {
        seconds <= u32(60) {
	    pluralize(seconds, 'second', 'seconds', mut res)
	}
        seconds <= u32(3600) {
            minutes = seconds / 60
            seconds -= (minutes * 60)
	    pluralize(minutes, 'minute', 'minutes', mut res)
	    pluralize(seconds, 'second', 'seconds', mut res)
        } else {
            hours = seconds / 3600
            minutes = (seconds % 3600) / 60
            seconds -= (hours * 3600) + (minutes * 60)
	    pluralize(hours, 'hour', 'hours', mut res)
	    pluralize(minutes, 'minute', 'minutes', mut res)
	    pluralize(seconds, 'second', 'seconds', mut res)
        }
    }
    t_amount := res.join(' ') + '.'
    return t_amount
}
