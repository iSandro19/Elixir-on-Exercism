defmodule Username do
  def sanitize([]), do: []
  def sanitize([h | tail]) do
    case h do
      ?_ -> [h | sanitize(tail)]
      h when h < ?a -> sanitize(tail)
      h when h <= ?z -> [h | sanitize(tail)]
      ?ä -> 'ae' ++ sanitize(tail)
      ?ö -> 'oe' ++ sanitize(tail)
      ?ü -> 'ue' ++ sanitize(tail)
      ?ß -> 'ss' ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end

#https://exercism.org/mentoring/external_requests/52ada18a44304c6f9222d8234536939d
