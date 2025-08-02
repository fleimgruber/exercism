defmodule BirdCount do
  def today(list) do
    case list do
      [] -> nil
      [head | _] -> head
    end
  end

  def increment_day_count(list) do
    case list do
      [] -> [1]
      [head | tail] -> [head + 1 | tail]
    end
  end

  def has_day_without_birds?(list) do
    case list do
      [] -> false
      _ -> Enum.member?(list, 0)
    end
  end

  def total(list) do
    Enum.reduce(list, 0, &+/2)
  end

  def busy_days(list) do
    Enum.count(list, &(&1 >= 5))
  end
end
