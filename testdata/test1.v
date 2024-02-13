fn main() {
    mut seconds := u32(80000)
    mut minutes := u32(0)
    mut hours := u32(0)

    //if seconds > 60 {
    //    minutes = seconds / 60
    //    seconds %= 60
    //}
    //println('$minutes minutes and $seconds seconds.')

    //time_spent := if seconds / 60 < 1 {
    //    seconds %= 60
    //    '$seconds seconds.'
    //} else {
    //    minutes = seconds / 60
    //    seconds %= 60
    //    '$minutes minutes and $seconds seconds.'
    //}
    //println('You spend $time_spent')
    //println(typeof(time_spent).name)

    time_spent := match true {
	seconds <= u32(60) { '$seconds seconds.' }
	seconds <= u32(3600) {
	    minutes = seconds / 60
	    seconds -= (minutes * 60)
	    '$minutes minutes $seconds seconds.'
	} else {
	    hours = seconds / 3600
	    minutes = (seconds % 3600) / 60
	    seconds -= (hours * 3600) + (minutes * 60)
	    '$hours hours $minutes minutes $seconds seconds.'
	}
    }
    println('You spend $time_spent')
}
