defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list), do: tl(list)

  def first(list), do: hd(list)

  def count(list), do: length(list)

  def functional_list?(list), do: "Elixir" in list
end

#https://exercism.org/mentoring/external_requests/1f21506e25ac491880e9db0bbbf78388
