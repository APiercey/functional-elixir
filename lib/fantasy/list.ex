defimpl Fantasy.Functor, for: List do
  def fmap([], _), do: []
  def fmap([head], fun), do: [fun.(head)]
  def fmap([head | tail], fun), do: [fun.(head) | fmap(tail, fun)]
end
