defmodule KitchenCalculator do
  def get_volume({_, value}), do: value

  def to_milliliter({:cup, value}), do: {:milliliter, value * 240.0}

  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30.0}

  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5.0}

  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15.0}

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}

  def from_milliliter({:milliliter, value}, :cup), do: {:cup, value / 240.0}

  def from_milliliter({:milliliter, value}, :fluid_ounce), do: {:fluid_ounce, value / 30.0}

  def from_milliliter({:milliliter, value}, :teaspoon), do: {:teaspoon, value / 5.0}

  def from_milliliter({:milliliter, value}, :tablespoon), do: {:tablespoon, value / 15.0}

  def from_milliliter({:milliliter, value}, :milliliter), do: {:milliliter, value}

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end

#https://exercism.org/mentoring/external_requests/ed67ce7d1cfb42eba53892b673822535
