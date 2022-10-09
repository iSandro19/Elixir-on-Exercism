defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(
      inventory,
      &(&1.price)
    )
  end

  def with_missing_price(inventory) do
    Enum.filter(
      inventory,
      &(!&1.price)
    )
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(
      inventory,
      &(%{&1 | name: String.replace(&1.name, old_word, new_word)})
    )
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {key, value} -> {key, value + count} end)}
  end

  def total_quantity(item) do
    Enum.reduce(
      item.quantity_by_size,
      0,
      fn {_, value}, acc -> value + acc end
    )
  end
end

#https://exercism.org/mentoring/external_requests/4c0002f407fe466c9d977ef0e072fe01
