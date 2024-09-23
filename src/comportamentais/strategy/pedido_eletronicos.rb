class PedidoEletronicos < Pedido
  attr_accessor :nome_setor

  def initialize
    @nome_setor = 'Eletrônicos'
  end
end
