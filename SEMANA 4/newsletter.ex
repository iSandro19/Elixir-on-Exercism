defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |> String.split("\n", trim: true)
  end

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    dest = open_log(log_path)
    read_emails(emails_path)
    |> Enum.each(fn email ->
      case send_fun.(email) do
        :ok -> log_sent_email(dest, email)
        :error -> :error
      end
    end)
    close_log(dest)
  end
end

#https://exercism.org/mentoring/external_requests/b4b045b49b004593b0d7de785ff5168f
