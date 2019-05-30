defmodule NothingTest do
  use ExUnit.Case

  alias Fantasy.{Functor, Nothing}

  test "is mapable yet returns nil" do
    assert %{value: nil} = Nothing.of() |> Functor.fmap(fn x -> x * x end)
  end

  test "mapping still return a Nothing" do
    assert %Nothing{} = 2 |> Nothing.of() |> Functor.fmap(fn x -> x * x end)
  end
end
