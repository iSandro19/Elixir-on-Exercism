defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1                 -> :debug
      level == 2                 -> :info
      level == 3                 -> :warning
      level == 4                 -> :error
      level == 5 and not legacy? -> :fatal
      true                       -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label == :error                    -> :ops
      label == :fatal                    -> :ops
      label == :unknown and legacy?      -> :dev1
      label == :unknown and not legacy?  -> :dev2
      true                               -> :false
    end
  end
end

#https://exercism.org/mentoring/external_requests/4c5e1a984ca249a8849f5fe4d64d86c7
