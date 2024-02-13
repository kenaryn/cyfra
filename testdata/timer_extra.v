fn pluralize(amount int, single string, many string, mut res []string) {
    if amount == 1 {
        res << '$amount $single'
    } else if amount > 1 {
        res << '$amount $many'
    }
}

fn f1(time_in_seconds int) string {
    hours := time_in_seconds / 3600
    h_remainder := (time_in_seconds - (hours * 3600))
    minutes := h_remainder / 60
    m_remainder := h_remainder - (minutes*60)
    seconds := m_remainder
    mut res := []string{}
    pluralize(hours, 'hour', 'hours', mut res)
    pluralize(minutes, 'minute', 'minutes', mut res)
    pluralize(seconds, 'second', 'seconds', mut res)
    if res.len == 0 {
        res << 'no time'
    }
    time_spent := res.join(' ') + '.'
    return time_spent
}

fn main() {
    duration := f1(100)
    println(duration)
}
