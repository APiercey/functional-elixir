defmodule JustTest do
  use ExUnit.Case

  alias Fantasy.{Functor, Just}

  test "is a map" do
    expected = 1
    assert %{value: ^expected} = Just.of(expected)
  end

  test "is mapable" do
    assert %{value: 4} = 2 |> Just.of() |> Functor.fmap(fn x -> x * x end)
  end

  test "mapping still return a Just" do
    assert %Just{} = 2 |> Just.of() |> Functor.fmap(fn x -> x * x end)
  end
end
