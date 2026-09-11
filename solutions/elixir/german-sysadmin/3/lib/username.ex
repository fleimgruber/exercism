defmodule Username do
  @subs %{
    ?ä => ~c"ae",
    ?ö => ~c"oe",
    ?ü => ~c"ue",
    ?ß => ~c"ss"
  }

  def sanitize(username) do
    Enum.flat_map(username, fn char ->
      case Map.fetch(@subs, char) do
        {:ok, sub} -> sub
        :error when char in ?a..?z or char == ?_ -> [char]
        :error -> []
      end
    end)
  end
end
