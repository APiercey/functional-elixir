defmodule MaybeTest do
  use ExUnit.Case
  alias Fantasy.{Maybe, Nothing, Just, Functor}

  test "no args returns a nothing" do
    assert %Maybe{value: %Nothing{}} = Maybe.of()
  end

  test "nil as args returns a nothing" do
    assert %Maybe{value: %Nothing{}} = nil |> Maybe.of()
  end

  test "a value as args returns a just" do
    assert %Maybe{value: %Just{}} = 5 |> Maybe.of()
  end

  test "is mapable" do
    assert %Maybe{} = Maybe.of() |> Functor.fmap(fn x -> x end)
  end

  test "returns a Just" do
    assert %Maybe{value: %Just{}} = 5 |> Maybe.of() |> Functor.fmap(fn x -> x * x end)
  end

  test "returns a Nothing" do
    assert %Maybe{value: %Nothing{}} = nil |> Maybe.of() |> Functor.fmap(fn x -> x * x end)
  end

  test "unwrappable" do
    assert 5 = 5 |> Maybe.of() |> Maybe.unwrap()
  end
end
