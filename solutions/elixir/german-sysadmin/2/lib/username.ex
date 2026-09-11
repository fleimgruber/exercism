defmodule Username do
  @subs %{
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue",
    ?ß => ~c"ss"
  }

  def sanitize(username) do
    Enum.flat_map(username, fn char ->
      cond do
        Map.has_key?(@subs, char) -> @subs[char]
        char in ?a..?z or char == ?_ -> [char]
        true -> []
      end
    end)
  end
end
