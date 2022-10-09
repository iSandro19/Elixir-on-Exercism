defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({op, _, args} = ast, acc) when op in [:def, :defp] do
    {ast, [decode_ast(args) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}
  defp decode_ast([{:when, _, args} | _]), do: decode_ast(args)
  defp decode_ast([{fname, _, args} | _]) when is_list(args), do: decode_fname(fname, args)
  defp decode_ast([{_name, _, args} | _]) when is_atom(args), do: ""
  defp decode_fname(fname, args) do
    to_string(fname)
    |> String.slice(0, length(args))
  end

  def decode_secret_message(string) do
    to_ast(string)
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end
end

#https://exercism.org/mentoring/external_requests/3b585a1d75cd484d81b94e618e12f9bc
