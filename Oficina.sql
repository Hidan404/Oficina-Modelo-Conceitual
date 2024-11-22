CREATE SCHEMA IF NOT EXISTS `Oficina` DEFAULT CHARACTER SET utf8;
show databases;
show tables;
USE `Oficina`;

CREATE TABLE `PessoaFisica` (
  `idPessoaFisica` INT NOT NULL,
  `CPF` VARCHAR(45) NULL,
  `DataNascimento` DATE NULL,
  PRIMARY KEY (`idPessoaFisica`)
) ENGINE = InnoDB;

CREATE TABLE `PessoaJuridica` (
  `idPessoaJuridica` INT NOT NULL,
  `CNPJ` VARCHAR(45) NULL,
  `RazaoSocial` VARCHAR(45) NULL,
  `NomeFantasia` VARCHAR(45) NULL,
  PRIMARY KEY (`idPessoaJuridica`)
) ENGINE = InnoDB;

CREATE TABLE `Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(120) NULL,
  `Telefone` VARCHAR(50) NULL,
  `Endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE = InnoDB;

CREATE TABLE `Entrega` (
  `idEntrega` INT NOT NULL,
  `DataEntrega` DATE NULL,
  `CodigoRastreio` VARCHAR(45) NULL,
  `StatusEntrega` VARCHAR(45) NULL,
  `DataEnvio` DATE NULL,
  PRIMARY KEY (`idEntrega`)
) ENGINE = InnoDB;

CREATE TABLE `Pedido` (
  `idPedido` INT NOT NULL,
  `StatusPedido` VARCHAR(45) NULL,
  `Descricao` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,
  `Entrega_idEntrega` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`, `Entrega_idEntrega`),
  FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`),
  FOREIGN KEY (`Entrega_idEntrega`) REFERENCES `Entrega` (`idEntrega`)
) ENGINE = InnoDB;

CREATE TABLE `Produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descricao` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE = InnoDB;

CREATE TABLE `Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `RazaoSocial` VARCHAR(120) NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE = InnoDB;

CREATE TABLE `ProdutoDisponibilizando` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`),
  FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE = InnoDB;

CREATE TABLE `Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE = InnoDB;

CREATE TABLE `Estoque_Produto` (
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`),
  FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `Estoque` (`idEstoque`),
  FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE = InnoDB;

CREATE TABLE `Pagamento` (
  `idPagamento` INT NOT NULL,
  `Valor` FLOAT NULL,
  `DataPagamento` DATE NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idPagamento`),
  FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`)
) ENGINE = InnoDB;



-- Povoando as tabelas

USE mydb;

-- Populando a tabela Pessoa/fisica
INSERT INTO `PessoaFisica` (`idPessoaFisica`, `CPF`, `DataNascimento`)
VALUES
(1, '111.111.111-11', '1990-01-01'),
(2, '222.222.222-22', '1985-02-02'),
(3, '333.333.333-33', '2000-03-03'),
(4, '444.444.444-44', '1995-04-04'),
(5, '555.555.555-55', '1980-05-05');

-- Populando a tabela Pessoa/juridica
INSERT INTO `PessoaJuridica` (`idPessoaJuridica`, `CNPJ`, `RazaoSocial`, `NomeFantasia`)
VALUES
(1, '11.111.111/0001-11', 'Empresa A', 'Fantasia A'),
(2, '22.222.222/0002-22', 'Empresa B', 'Fantasia B'),
(3, '33.333.333/0003-33', 'Empresa C', 'Fantasia C'),
(4, '44.444.444/0004-44', 'Empresa D', 'Fantasia D'),
(5, '55.555.555/0005-55', 'Empresa E', 'Fantasia E');

-- Populando a tabela Cliente
INSERT INTO Cliente (`idCliente`, `Nome`, `Telefone`, `Endereco`)
VALUES
(1, 'Cliente A', '1111-1111', 'Rua A, 100'),
(2, 'Cliente B', '2222-2222', 'Rua B, 200'),
(3, 'Cliente C', '3333-3333', 'Rua C, 300'),
(4, 'Cliente D', '4444-4444', 'Rua D, 400'),
(5, 'Cliente E', '5555-5555', 'Rua E, 500');

-- Populando a tabela Entrega
INSERT INTO Entrega (`idEntrega`, `DataEntrega`, `CodigoRastreio`, `StatusEntrega`, `DataEnvio`)
VALUES
(1, '2024-11-21', 'R001', 'Entregue', '2024-11-20'),
(2, '2024-11-22', 'R002', 'Em trânsito', '2024-11-21'),
(3, '2024-11-23', 'R003', 'Em trânsito', '2024-11-22'),
(4, '2024-11-24', 'R004', 'Aguardando envio', '2024-11-23'),
(5, '2024-11-25', 'R005', 'Entregue', '2024-11-24');

-- Populando a tabela Pedido
INSERT INTO Pedido (`idPedido`, `StatusPedido`, `Descricao`, `Cliente_idCliente`, `Frete`, `Entrega_idEntrega`)
VALUES
(1, 'Pendente', 'Pedido A', 1, 10.50, 1),
(2, 'Entregue', 'Pedido B', 2, 20.00, 2),
(3, 'Cancelado', 'Pedido C', 3, 15.75, 3),
(4, 'Pendente', 'Pedido D', 4, 5.00, 4),
(5, 'Em andamento', 'Pedido E', 5, 12.30, 5);

-- Populando a tabela Produto
INSERT INTO Produto (`idProduto`, `Categoria`, `Descricao`, `Valor`)
VALUES
(1, 'Eletrônicos', 'Celular', '1500.00'),
(2, 'Eletrônicos', 'Notebook', '2500.00'),
(3, 'Eletrodomésticos', 'Geladeira', '3000.00'),
(4, 'Eletrodomésticos', 'Microondas', '500.00'),
(5, 'Móveis', 'Cadeira', '200.00');

-- Populando a tabela Fornecedor
INSERT INTO Fornecedor (`idFornecedor`, `RazaoSocial`, `CNPJ`)
VALUES
(1, 'Fornecedor A', '66.666.666/0001-66'),
(2, 'Fornecedor B', '77.777.777/0002-77'),
(3, 'Fornecedor C', '88.888.888/0003-88'),
(4, 'Fornecedor D', '99.999.999/0004-99'),
(5, 'Fornecedor E', '00.000.000/0005-00');

-- Populando a tabela Produto Disponibilizando
INSERT INTO `ProdutoDisponibilizando` (`Fornecedor_idFornecedor`, `Produto_idProduto`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populando a tabela Estoque
INSERT INTO Estoque (`idEstoque`, `Local`)
VALUES
(1, 'Armazém A'),
(2, 'Armazém B'),
(3, 'Armazém C'),
(4, 'Armazém D'),
(5, 'Armazém E');

-- Populando a tabela Estoque_has_Produto
INSERT INTO Estoque_Produto (`Estoque_idEstoque`, `Produto_idProduto`, `Quantidade`)
VALUES
(1, 1, 100),
(2, 2, 200),
(3, 3, 150),
(4, 4, 80),
(5, 5, 50);

-- Populando a tabela pedido/produtos
INSERT INTO `pedido/produtos` (`Produto_idProduto`, `Pedido_idtable1`, `Pedido_Cliente_idCliente`, `quantidade`)
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 5),
(4, 4, 4, 3),
(5, 5, 5, 4);

-- Populando a tabela Terceiro -Vendedor
INSERT INTO `Terceiro -Vendedor` (`idTerceiro -Vendedor`, `Razão Social`, `CNPJ`, `Local`)
VALUES
(1, 'Terceiro A', '10.000.000/0001-10', 'Local A'),
(2, 'Terceiro B', '20.000.000/0002-20', 'Local B'),
(3, 'Terceiro C', '30.000.000/0003-30', 'Local C'),
(4, 'Terceiro D', '40.000.000/0004-40', 'Local D'),
(5, 'Terceiro E', '50.000.000/0005-50', 'Local E');

-- Populando a tabela Pagamento
INSERT INTO Pagamento (`idPagamento`, `valor`, `DataPagamento`, `Pedido_idtable1`, `Pedido_Cliente_idCliente`)
VALUES
(1, 150.00, '2024-11-21', 1, 1),
(2, 250.00, '2024-11-22', 2, 2),
(3, 300.00, '2024-11-23', 3, 3),
(4, 500.00, '2024-11-24', 4, 4),
(5, 200.00, '2024-11-25', 5, 5);

-- Populando a tabela FormaPagamentos
INSERT INTO Pagamento (`idPagamento`, `Valor`, `DataPagamento`, `Pedido_idPedido`)
VALUES
(1, 500.00, '2024-11-01', 1),
(2, 648.89, '2024-11-02', 2),
(3, 8000.00, '2024-11-03', 3),
(4, 10.00, '2024-11-04', 4),
(5, 250.00, '2024-11-05', 5);









SET @schema = 'Oficina'; -- Altere para o nome do seu banco

SELECT 
    TABLE_NAME, 
    TABLE_ROWS AS total_registros 
FROM 
    INFORMATION_SCHEMA.TABLES 
WHERE 
    TABLE_SCHEMA = @schema;


