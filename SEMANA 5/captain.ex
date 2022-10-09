defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number(), do: "NCC-#{Enum.random(1000..9999)}"

  def random_stardate(), do: 41000.0 + :rand.uniform() * 1000.0

  def format_stardate(stardate) when is_float(stardate), do: :io_lib.format("~.1f", [stardate]) |> to_string()
  def format_stardate(_stardate), do: raise ArgumentError
end

#https://exercism.org/mentoring/external_requests/ec2a0f29729442029cd40094b0bac741
