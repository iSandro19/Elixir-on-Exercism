defmodule HighScore do
  require Map
  @initial_score 0

  def new() do
    Map.new()
  end

  def add_player(scores, name, score \\ @initial_score)

  def add_player(scores, name, score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, score) do
    Map.update(
      scores,
      name,
      score,
      fn existing_value -> existing_value + score
    end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end

#https://exercism.org/mentoring/external_requests/3d1c732c584a418abe3d0023cd51e234
