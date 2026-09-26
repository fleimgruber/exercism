pub fn reply(guess: Int) -> String {
  case guess {
    guess if guess < 41 -> "Too low"
    guess if 41 == guess || 43 == guess -> "So close"
    guess if guess == 42 -> "Correct"
    guess if guess > 43 -> "Too high"
    _ -> ""
  }
}
