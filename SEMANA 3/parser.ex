defmodule LogParser do
  def valid_line?(line) do
    String.starts_with?(line, ["[DEBUG]", "[INFO]", "[WARNING]", "[ERROR]"])
  end

  def split_line(line) do
    Regex.split(~r/<(?:\~|\*|\=|\-)*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line(?:\d)+/i, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User(?:(?:\s|\t|\n|\r)+)(\S+)(?:(?:\s|\t|\n|\r)*)/u, line) do
      nil -> line
      [_global, username | _tail] -> "[USER] " <> username <> " " <> line
    end
  end
end

#https://exercism.org/mentoring/external_requests/2c2fa66c1b914a75ab491edc77cda78e
