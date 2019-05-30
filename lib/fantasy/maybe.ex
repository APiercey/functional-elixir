defmodule Fantasy.Maybe do
  @moduledoc """
    Maybe 
  """
  @enforce_keys [:value]
  defstruct [:value]

  alias Fantasy.{Nothing, Just, Maybe}

  def of(), do: Nothing.of() |> wrap()
  def of(nil), do: Nothing.of() |> wrap()
  def of(%Nothing{}), do: Nothing.of() |> wrap()
  def of(value), do: value |> Just.of() |> wrap()

  defp wrap(value), do: %Maybe{value: value}
end

defimpl Fantasy.Functor, for: Fantasy.Maybe do
  alias Fantasy.{Functor, Maybe}

  def fmap(%{value: value}, fun) do
    value
    |> Functor.fmap(fun)
    |> Maybe.of()
  end
end
