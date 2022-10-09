defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
  defexception message: "stack underflow occurred"
  @impl true
    def exception(context) do
      case context do
        [] -> %StackUnderflowError{}
        _  -> %StackUnderflowError{message: "stack underflow occurred, context: " <> context}
      end
    end
  end

  def divide([]), do: raise StackUnderflowError, "when dividing"
  def divide([_]), do: raise StackUnderflowError, "when dividing"
  def divide([0, _]), do: raise DivisionByZeroError
  def divide([d, n]), do: n / d
end

#https://exercism.org/mentoring/external_requests/1a54a3513840490ca60e88d122af36a2
