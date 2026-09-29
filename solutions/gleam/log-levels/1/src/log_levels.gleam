import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> rest -> string.trim(rest)
    "[INFO]: " <> rest -> string.trim(rest)
    "[WARNING]: " <> rest -> string.trim(rest)
    _ -> "Log level not supported"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> _ -> "error"
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    _ -> "Log level format not supported"
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> rest -> string.trim(rest) <> " (error)"
    "[INFO]: " <> rest -> string.trim(rest) <> " (info)"
    "[WARNING]: " <> rest -> string.trim(rest) <> " (warning)"
    _ -> "Log level not supported"
  }
}
