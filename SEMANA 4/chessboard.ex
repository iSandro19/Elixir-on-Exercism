defmodule Chessboard do
  def rank_range, do: 1..8
  def file_range, do: ?A..?H
  def ranks, do: Enum.to_list(rank_range())
  def files, do: Enum.to_list(file_range()) |> Enum.map(& <<&1>>)
end

#https://exercism.org/mentoring/external_requests/ab8227e4f8c84cada0f516c583caa65e
