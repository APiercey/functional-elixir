defmodule ListTest do
  use ExUnit.Case
  alias Fantasy.Functor

  test "is mapable" do
    assert [1] = Functor.fmap([1], fn x -> x end)
  end

  test "supports larger lists" do
    assert [2, 4, 6] = Functor.fmap([1, 2, 3], fn x -> x * 2 end)
  end
end
