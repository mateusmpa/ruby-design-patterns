# Strategy

## Definição

O padrão de projeto Strategy define uma família de algoritmos, encapsula cada um deles e os torna intercambiáveis. O Strategy permite que o algoritmo varie independentemente dos clientes que o utilizam.

```mermaid
---
title: Strategy
---
classDiagram
Contexto o-- Strategy
Strategy <|.. EstrategiaConcretaA
Strategy <|.. EstrategiaConcretaB
Strategy <|.. EstrategiaConcretaC

  class Contexto{
    instancia_de_strategy: Strategy
    + solicitacao()
  }

  class Strategy{
    <<Interface>>
    + comportamento()
  }

  class EstrategiaConcretaA{
    + comportamento()
  }

  class EstrategiaConcretaB{
    + comportamento()
  }

  class EstrategiaConcretaC{
    + comportamento()
  }
```
:camera: Diagrama de classes do padrão Strategy

## Exemplo de implementação

```mermaid
classDiagram
Pedido <|-- PedidoEletronicos
Pedido <|-- PedidoMoveis
Pedido o-- Frete
Frete <|.. FreteComum
Frete <|.. FreteExpresso

  class Pedido{
    - valor
    - frete
    + valor()
    + valor=(valor)
    + frete()
    + frete=(frete)
    + calcula_frete()
  }

  class PedidoEletronicos{
    - nome_setor
    + nome_setor()
    + nome_setor=(nome_setor)
  }

  class PedidoMoveis{
    - nome_setor
    + nome_setor()
    + nome_setor=(nome_setor)
  }

  class Frete{
    <<Interface>>
    + calcula(valor)
  }

  class FreteComum{
    + calcula(valor)
  }

  class FreteExpresso{
    + calcula(valor)
  }
```
:camera: Implementação do diagrama de classes

```ruby
require './src/comportamentais/strategy/pedido.rb'
require './src/comportamentais/strategy/pedido_moveis.rb'
require './src/comportamentais/strategy/pedido_eletronicos.rb'
require './src/comportamentais/strategy/frete_comum.rb'
require './src/comportamentais/strategy/frete_expresso.rb'

frete_comum = FreteComum.new
frete_expresso = FreteExpresso.new

pedido_moveis = PedidoMoveis.new
pedido_moveis.valor = 100

pedido_moveis.frete = frete_comum
pedido_moveis.calcula_frete
# 5.0

pedido_moveis.frete = frete_expresso
pedido_moveis.calcula_frete
# 10.0

pedido_eletronicos = PedidoEletronicos.new
pedido_eletronicos.valor = 100

pedido_eletronicos.frete = frete_comum
pedido_eletronicos.calcula_frete
# 5.0

pedido_eletronicos.frete = frete_expresso
pedido_eletronicos.calcula_frete
# 10.0
```
:camera: Testes da implementação
