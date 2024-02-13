module util

import time

fn get_stat() {
    println('---statistics---')
    t_elapsed := time_elapsed(sw)
    println('running the program for $t_elapsed seconds.')
}

fn time_elapsed(sw time.StopWatch) int {
    return sw.elapsed().seconds()
}
