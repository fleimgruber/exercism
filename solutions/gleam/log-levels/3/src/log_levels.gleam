import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> message -> message
    "[ERROR]:" <> message -> message
    "[WARNING]:" <> message -> message
    _ -> "Log level format not supported"
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    "[INFO]" <> _ -> "info"
    _ -> "Log level format not supported"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
