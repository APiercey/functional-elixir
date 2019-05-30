defprotocol Fantasy.Functor do
  @doc "functors!"

  def fmap(fun, data)
end
