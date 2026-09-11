defmodule Username do
  def sanitize([]), do: []

  @subs %{"ä" => "ae", "ö" => "oe", "ü" => "ue", "ß" => "ss"}

  def sanitize(username) when is_binary(username) do
    @subs
    |> Enum.reduce(username, fn {k, v}, acc -> String.replace(acc, k, v) end)
    |> String.replace(~r/[^a-z_]/, "")
  end

  def sanitize(username) when is_list(username) do
    username
    |> Enum.filter(&(&1 in 0x0000..0xD7FF or &1 in 0xE000..0x10FFFF))
    |> List.to_string()
    |> sanitize()
    |> String.to_charlist()
  end
end
