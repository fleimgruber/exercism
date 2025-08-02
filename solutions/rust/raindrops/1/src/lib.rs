pub fn raindrops(n: u32) -> String {
    let mut result: String = "".to_owned();
    if n % 3 == 0 {
        result = result + "Pling";
    }
    if n % 5 == 0 {
        result = result + "Plang";
    }
    if n % 7 == 0 {
        result = result + "Plong";
    }
    if result == "" {
        result = n.to_string();
    }
    return result;
}
