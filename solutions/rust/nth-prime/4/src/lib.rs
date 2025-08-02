pub fn is_prime(n: u32) -> bool {
    if n == 3 || n == 5 {
        return true;
    }
    !(2..(n as f32).sqrt() as u32 + 1).any(|x| n % x == 0)
}

pub fn nth(n: u32) -> u32 {
    (2..).step_by(2).filter(|&x| is_prime(x)).nth(n as usize).unwrap()
}
