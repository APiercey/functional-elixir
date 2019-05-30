defmodule Fantasy.Just do
  @enforce_keys [:value]
  defstruct [:value]

  def of(value), do: %Fantasy.Just{value: value}
end

defimpl Fantasy.Functor, for: Fantasy.Just do
  alias Fantasy.Just

  def fmap(%{value: value}, fun) do
    value
    |> fun.()
    |> Just.of()
  end
end
