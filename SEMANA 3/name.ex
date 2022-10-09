defmodule NameBadge do
  def print(id, name, department) do
    id_string = if id do
      "[#{id}] - "
    else
      ""
    end
    department_string = if department do
      " - " <> String.upcase(department)
    else
      " - OWNER"
    end
    id_string <> name <> department_string
  end
end

#https://exercism.org/mentoring/external_requests/7307498311114fc68ad5264c76d69142
