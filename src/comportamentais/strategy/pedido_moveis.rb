class PedidoMoveis < Pedido
  attr_accessor :nome_setor

  def initialize
    @nome_setor = 'Móveis'
  end
end
