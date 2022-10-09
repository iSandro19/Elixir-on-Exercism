defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        loop(state + 1)

      :stop -> nil

      _ -> loop(state)
    end
  end
end

#https://exercism.org/mentoring/external_requests/a166093a85db4e38a020c41b9c23b287
