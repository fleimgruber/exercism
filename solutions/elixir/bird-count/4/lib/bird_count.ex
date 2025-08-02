defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count(list) do
    case list do
      [] -> [1]
      [head | tail] -> [head + 1 | tail]
    end
  end

  def has_day_without_birds?(list), do: has_day_without_birds?(list, 0)
  defp has_day_without_birds?([], _value), do: false
  defp has_day_without_birds?([head | _tail], value) when head == value, do: true
  defp has_day_without_birds?([_head | tail], value), do: has_day_without_birds?(tail, value)

  def total(list), do: total(list, 0)
  defp total([], acc), do: acc
  defp total([head | tail], acc), do: total(tail, acc + head)

  def busy_days(list), do: busy_days(list, 0, 5)
  defp busy_days([], acc, _target), do: acc
  defp busy_days([head | tail], acc, target) when head >= target, do: busy_days(tail, acc + 1, target)
  defp busy_days([_head | tail], acc, target), do: busy_days(tail, acc, target)
end
