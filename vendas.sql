-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Set-2022 às 01:25
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: vendas
--

CREATE DATABASE vendas;

-- --------------------------------------------------------

--
-- Estrutura da tabela clientes
--

CREATE TABLE clientes (
  codigo_cliente int(100) NOT NULL,
  nome varchar(100) NOT NULL,
  cidade varchar(100) NOT NULL,
  uf varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela clientes
--

INSERT INTO clientes (codigo_cliente, nome, cidade, uf) VALUES
(1, 'JOSE CARLOS', 'SAO PEDRO DA ALDEIA', 'RJ'),
(2, 'FLAVIA SAMPAIO', 'SAO PEDRO DA ALDEIA', 'RJ'),
(3, 'MARIANE MARINHO', 'CABO FRIO', 'RJ'),
(4, 'JOSUE MARINHO', 'BELFORD ROXO', 'RJ'),
(5, 'KAUAN OAZEM', 'BRUMADINHO', 'MG'),
(6, 'VANIA SAMPAIO', 'BARBACENA', 'MG'),
(7, 'ALESSSANDRA SILVA', 'POCOS DE CALDA', 'MG'),
(8, 'ADRIANNO DA SILVA', 'RIO DE JANEIRO', 'RJ'),
(9, 'CELIA PATRICIO', 'SAO PAULO', 'SP'),
(10, 'ANTONIO GOMES', 'CAMPOS DO JORDAO', 'SP'),
(11, 'ORMEZINDA DIAS', 'BELO HORIZONTE', 'MG'),
(12, 'VANESSA AGUIAR', 'VILA VELHA', 'ES'),
(13, 'ROSEMARY MACIEL', 'BUZIOS', 'RJ'),
(14, 'CELSO DE SOUZA', 'ARARUAMA', 'TO'),
(15, 'ANA LAURA BORGES', 'IGUABA', 'RN'),
(16, 'CARLOS EDUARDO DE NOBREGA', 'RIO DAS OSTRAS', 'RJ'),
(17, 'VITORIA REGIA', 'RIO BONITO', 'CE'),
(18, 'REGINA VALVERDE', 'RECIDE', 'PE'),
(19, 'CAMILA DUARTE', 'PETROPOLIS', 'RJ'),
(20, 'LUCIANO CAMARGO', 'XEREM', 'RJ'),
(21, 'JOAO VITOR SILVA', 'FLORIANOPOLIS', 'SC'),
(22, 'FERNANDA SAAD', 'GRAMADO', 'SP'),
(23, 'CRISTIANO RONALDO', 'BLUMENAU', 'SC'),
(24, 'ANA PAULA AFONSO', 'SANTO CRISTO', 'RO'),
(25, 'CLEBER LUCAS MOREIRA', 'CACHOEIROS DE MACACU', 'AM'),
(26, 'SUNAMITA DO CARMO', 'ITAPEMIRIM', 'PA'),
(27, 'ALCIDES VIGARIO DO SANTOS', 'BANGU', 'RJ'),
(28, 'ROBERTA DE JESUS', 'REALENGO', 'RJ'),
(29, 'JENNIFER AFONSO', 'BARRA DA TIJUCA', 'RJ'),
(30, 'RONALDO DE SOUZA', 'NITEROI', 'RJ'),
(31, 'ANDRE COLIMOIDE', 'SAO GONCALO', 'RJ'),
(32, 'SUZANA VIEIRA', 'CURITIBA', 'PR'),
(33, 'ONEZIA COSTA BORGES', 'PORTO VELHO', 'RO'),
(34, 'ARMINDA VITORIA', 'MANAUS', 'AM'),
(35, 'ANA CLARA VIEIRA', 'BRASILIA', 'DF'),
(36, 'JOAO MATHEUS', 'BELFORD ROXO', 'RJ'),
(37, 'JOAO MATHEUS', 'BELFORD ROXO', 'RJ'),
(38, 'JOAO MATHEUS', 'BELFORD ROXO', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela pedidos
--

CREATE TABLE pedidos (
  numero_pedido int(11) NOT NULL,
  data_emissao date NOT NULL,
  codigo_cliente int(11) NOT NULL,
  valor_total decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estrutura da tabela pedidos_produtos
--

CREATE TABLE pedidos_produtos (
  id_linha int(11) NOT NULL,
  numero_pedido int(11) NOT NULL,
  codigo_produto int(11) NOT NULL,
  quantidade int(11) NOT NULL,
  valor_unitario decimal(10,2) NOT NULL,
  valor_total decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estrutura da tabela produtos
--

CREATE TABLE produtos (
  codigo_produto int(11) NOT NULL,
  descricao varchar(100) NOT NULL,
  preco_venda double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela produtos
--

INSERT INTO produtos (codigo_produto, descricao, preco_venda) VALUES
(1, 'PORTA COPOS', 9.99),
(2, 'BIBLIA KING JAMES', 179.90),
(3, 'PORTA RETRATO', 9.49),
(4, 'COOLER', 74.90),
(5, 'SOFA RETRATIL', 2599.99),
(6, 'MOCHILA CARGO', 150.00),
(7, 'CALCA JEANS', 134.60),
(8, 'CAFETEIRA WALITA', 350.00),
(9, 'SSD SAMSUNG', 260.00),
(10, 'CELULAR MOTORLA EDGE', 2459.90),
(11, 'FILTRO SOFT', 650.00),
(12, 'SECADORA DE ROUPAS', 2999.99),
(13, 'MAQUINA DE LAVAR', 2599.99),
(14, 'TV LED LG 50 POLEGADAS', 3500.00),
(15, 'CADEIRA DE PRAIA', 99.00),
(16, 'JOGO DE PANELA', 300.00),
(17, 'BALDE', 7.00),
(18, 'PANO DE CHAO', 4.00),
(19, 'BICICLETA ARO 26 MONARK BARRA FORTE ARO 29', 1099.99),
(20, 'FOGAO INOX BRASTEMP', 2110.00),
(21, 'CHURRASQUEIRA ELETRICA', 234.99),
(22, 'LIQUIDIFICADOR MONDIAL', 179.99),
(23, 'MALA DE VIAGEM', 349.99),
(24, 'VENTILADOR DE TETO', 130.99),
(25, 'GRILL', 420.00),
(26, 'CADEIRA GAMER', 1200.90),
(27, 'BONE CAVALEIRA', 140.00),
(28, 'CHINELO REDLEY', 80.00),
(29, 'BERMUNDA JEANS', 90.00),
(30, 'BOLSA VITOR UGO', 1199.00),
(31, 'BANDEJA INOX TRAMONTINA', 54.99),
(32, 'FAQUEIRO TRAMONTINA 12 PECAS', 39.99);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela clientes
--
ALTER TABLE clientes
  ADD PRIMARY KEY (codigo_cliente);

--
-- Índices para tabela pedidos
--
ALTER TABLE pedidos
  ADD PRIMARY KEY (numero_pedido);

--
-- Índices para tabela pedidos_produtos
--
ALTER TABLE pedidos_produtos
  ADD PRIMARY KEY (id_linha);

--
-- Índices para tabela produtos
--
ALTER TABLE produtos
  ADD PRIMARY KEY (codigo_produto);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela clientes
--
ALTER TABLE clientes
  MODIFY codigo_cliente int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela pedidos
--
ALTER TABLE pedidos
  MODIFY numero_pedido int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de tabela pedidos_produtos
--
ALTER TABLE pedidos_produtos
  MODIFY id_linha int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de tabela produtos
--
ALTER TABLE produtos
  MODIFY codigo_produto int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
