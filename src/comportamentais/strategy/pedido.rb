class Pedido
  attr_accessor :valor, :frete

  def calcula_frete
    frete.calcula(valor)
  end
end
