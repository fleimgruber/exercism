extern crate unicode_segmentation;

use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    let mut s = String::from("");
    let _ = UnicodeSegmentation::graphemes(input, true).for_each(|i| s.insert_str(0, i));
    return s;
}
