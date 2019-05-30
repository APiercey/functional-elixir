defmodule Fantasy.Nothing do
  @enforce_keys [:value]
  defstruct [:value]

  def of(), do: %Fantasy.Nothing{value: nil}
  def of(_), do: %Fantasy.Nothing{value: nil}
end

defimpl Fantasy.Functor, for: Fantasy.Nothing do
  def fmap(%{}, _), do: %Fantasy.Nothing{value: nil}
end
