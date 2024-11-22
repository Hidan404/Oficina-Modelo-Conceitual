# Projeto Oficina - Modelo Lógico do Banco de Dados

Esse projeto foi criado para organizar e estruturar as informações de uma oficina de maneira eficiente. O foco está em atender às principais necessidades operacionais, como gerenciar clientes, produtos, fornecedores, estoque, pedidos, pagamentos e entregas. Com esse sistema, tudo fica mais claro e conectado, facilitando o dia a dia.

---

## Contexto do Sistema

A ideia principal é garantir que a oficina consiga:

- **Cadastrar Clientes** (pessoas físicas e jurídicas) e manter seus dados organizados.
- **Controlar Produtos** e saber de onde vêm os itens usados no serviço, conectando-os aos fornecedores.
- **Gerenciar Estoque**, para ter sempre o controle das quantidades disponíveis.
- **Acompanhar Pedidos e Pagamentos**, registrando o que foi solicitado e os pagamentos correspondentes.
- **Rastrear Entregas**, garantindo que os pedidos cheguem no prazo e com informações claras.

Essas funcionalidades são organizadas através de tabelas interligadas, cada uma com um papel claro dentro do sistema.

---

## Estrutura do Modelo Lógico

### Tabelas Principais

1. **Clientes**
   - Essa tabela guarda as informações básicas dos clientes, como nome, telefone e endereço.
   - Existem dois tipos de cliente:
     - **Pessoa Física:** Inclui CPF e data de nascimento.
     - **Pessoa Jurídica:** Inclui CNPJ, razão social e nome fantasia.

2. **Produtos**
   - Representa os itens que a oficina usa no dia a dia. 
   - Cada produto tem uma categoria, descrição e valor.

3. **Fornecedores**
   - Aqui ficam os dados das empresas que fornecem os produtos usados nos serviços.

4. **Estoque**
   - Gerencia os locais onde os produtos estão armazenados e suas respectivas quantidades.

5. **Pedidos**
   - Registra o que os clientes pedem, além de detalhes como descrição, status e valor do frete.

6. **Pagamentos**
   - Controla os pagamentos feitos pelos clientes, com o valor e a data de cada transação.

7. **Entregas**
   - Armazena informações sobre os envios, como o status da entrega e o código de rastreio.

---

### Relacionamentos

- **Cliente ↔ Pedidos:** Cada cliente pode fazer vários pedidos, mas cada pedido pertence a um único cliente.
- **Pedidos ↔ Entregas:** Cada pedido está associado a uma entrega.
- **Produtos ↔ Estoque:** Os produtos são vinculados ao estoque, permitindo o controle das quantidades.
- **Fornecedores ↔ Produtos:** Um fornecedor pode fornecer vários produtos, e um produto pode ser fornecido por vários fornecedores (relacionamento muitos-para-muitos).

---

## Por que este modelo é importante?

- **Sem dados duplicados:** O modelo foi feito para evitar informações repetidas. 
- **Facilidade de uso:** Com os relacionamentos bem definidos, é mais simples encontrar ou manipular os dados.
- **Pronto para crescer:** Caso a oficina precise de mais funcionalidades no futuro, é fácil expandir o modelo.

---

## Como Usar

1. **Script SQL:** Você pode usar o script incluído neste projeto para criar as tabelas e relacionamentos no banco de dados.
2. **Consultas:** Também foram criadas consultas SQL detalhadas, cobrindo desde o básico até operações mais complexas.

---

## Arquivo de Consultas

Se quiser exemplos práticos, veja o arquivo de [consultas detalhadas](/queries_detalhadas%20.txt) que acompanha o projeto. Ele contém tudo, desde seleções simples até junções mais avançadas.

---

## Conclusão

Com esse modelo lógico, a oficina terá uma base sólida para organizar as informações e facilitar o gerenciamento de tudo que acontece por lá. Desde o cadastro de clientes até o controle de estoque e rastreamento de entregas, tudo foi pensado para ser claro, eficiente e fácil de usar.
