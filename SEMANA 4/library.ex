defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601(string)
    |> elem(1)
  end

  def before_noon?(datetime) do
    noon = ~T[12:00:00]
    time = NaiveDateTime.to_time(datetime)
    rtdo = Time.compare(time, noon)
    case rtdo do
      :lt -> true
      _   -> false
    end
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true -> NaiveDateTime.add(checkout_datetime, 28, :day) |> NaiveDateTime.to_date()
      _    -> NaiveDateTime.add(checkout_datetime, 29, :day) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    cond do
      diff <= 0 -> 0
      true -> diff
    end
  end

  def monday?(datetime) do
    rtdo = Date.day_of_week(NaiveDateTime.to_date(datetime))
    case rtdo do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout = datetime_from_string(checkout)
    return = datetime_from_string(return)
    days_to_return = days_late(return_date(checkout), return)
    cond do
      monday?(return) -> Float.floor((days_to_return * rate) / 2)
      true -> days_to_return * rate
    end
  end
end

#https://exercism.org/mentoring/external_requests/35a8e19f2b454e64ae1f6e1b07c8d38a
