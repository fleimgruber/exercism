pub fn reverse(input: &str) -> String {
    let length = input.len();
    return (0..length).map(|i| input.chars().nth(length - i - 1).unwrap()).collect::<String>();
}
