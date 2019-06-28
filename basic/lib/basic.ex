defmodule Basic do
  @moduledoc """
  Documentation for Basic.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Basic.hello()
      :world

  """
  def hello do
    :world
  end

  def q1 do
    # Reading file
    data = File.stream!("data/data.json")

    # Convert JSON to map
    map_data = Enum.map(data, fn d -> Poison.decode!(d) end)

    # Filter by under age: age <= 20
    filtered_data = Enum.filter(map_data, fn d -> d["age"] <= 20 end)

    # Get amount of filtered rows
    Enum.count(filtered_data)
  end

  def q1-2 do
    "data.json"
    |> File.stream!
    |> Enum.map(fn d -> Poison.decode!(d) end)
    |> Enum.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end
end
