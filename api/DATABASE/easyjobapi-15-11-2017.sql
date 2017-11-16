-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Nov-2017 às 02:22
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyjobapi`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `CODITEM` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` text,
  `LINK` varchar(100) NOT NULL,
  `STATE` varchar(100) NOT NULL,
  `ORDEMMENU` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`CODITEM`, `NOME`, `DESCRICAO`, `LINK`, `STATE`, `ORDEMMENU`) VALUES
(1, 'Home - Candidato', 'Página de home (noticias, dicase e etc...) do candidato', 'Home', 'menu.candidatoHome', 1),
(2, 'Perfil - Candidato', 'Página de perfil de candidato, contém as informações de nome, usuário, email, senha e etc...', 'Perfil', 'menu.candidatoPerfil', 2),
(3, 'Currículo - candidato', 'Acesso do candidato para montagem de currículo.', 'Currículo', 'menu.candidatoCurriculo', 3),
(4, 'Combinações - Candidato', 'Página de combinações com as vagas ofertadas da empresa.', 'Combinações', 'menu.candidatoCombinacoes', 5),
(5, 'Vagas - Candidato', 'Página aonde o candidato poderá ver as vagas ofertadas pela empresa.', 'Vagas', 'menu.candidatoVagas', 4),
(6, 'Perfil - Empresa', 'Página aonde será exibido o perfil da empresa.', 'Perfil', 'menu.empresaPerfil', 2),
(7, 'Ofertar Vaga - Empresa', 'Página aonde a empresa poderá ofertar suas vagas de empregos.', 'Ofertar Vagas', 'menu.empresaOferta', 3),
(8, 'Combinações - Empresa', 'Página aonde a empresa poderá ver as combinações de vagas e currículo.', 'Combinações', 'menu.empresaCombinacoes', 5),
(9, 'Currículo - Empresa', 'Página aonde a empresa poderá ver os currículos cadastrados no sistema.', 'Currículos', 'menu.empresaCurriculo', 4),
(10, 'Home -  Empresa', 'Pagina home da empresa', 'Home', 'menu.empresaHome', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `CODPERFIL` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`CODPERFIL`, `NOME`, `DESCRICAO`) VALUES
(1, 'Candidato', 'Este perfil contém as permissões(acesso à menus) dos usuário do tipo candidato.'),
(2, 'Empresa', 'Este perfil contém as permissões(acesso à menus) dos usuário do tipo empresa.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `CODPERFIL` int(11) NOT NULL,
  `CODITEM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`CODPERFIL`, `CODITEM`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `CODPESSOA` int(11) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `USUARIO` varchar(45) NOT NULL,
  `SENHA` text NOT NULL,
  `TIPOUSUARIO` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`CODPESSOA`, `NOME`, `EMAIL`, `USUARIO`, `SENHA`, `TIPOUSUARIO`) VALUES
(1, 'Max Rogério', 'max10rogerio@hotmail.com', 'max.rogerio', 'ae86200ba1545d3244fde3aaacba2cfc', 0),
(2, 'max', 'maxrogerionogueira@outlook.com', 'maxrogerio', '2ffe4e77325d9a7152f7086ea7aa5114', 0),
(4, 'TS', 'teste@teste.com', 'TESTE', 'f3aa334b5e1c189cbab4393627825cd2', 0),
(5, 'leonardo beraldo', 'leonardo.beraldo@email.com', 'leonardo.beraldo', 'e10adc3949ba59abbe56e057f20f883e', 0),
(6, 'max', 'max@123', 'max123', 'a1b4e6a41314c96e0afe6bd9a67a9863', 1),
(30, 'perfil', 'test3@te', 'teste3', 'e10adc3949ba59abbe56e057f20f883e', 2),
(31, 'dhgfghghf', 'dgf@dfdg', 'hghj', 'e10adc3949ba59abbe56e057f20f883e', 1),
(32, 'Luingry', 'luingry@gmail.com', 'lui', '13f0e3b0373cf96539cf20879856e468', 1),
(33, 'Max', 'max123@123', 'max321321321', 'e10adc3949ba59abbe56e057f20f883e', 1),
(34, 'dsa', '', 'vagner', 'e10adc3949ba59abbe56e057f20f883e', 1),
(35, 'MaxT', 'msx@m', 'teste123', '280f5324cbe33b72ebeefbf2f879e216', 2),
(36, 'empresa', 'empresa@empresa', 'empresa', 'caff2749f2833128ee2d3fe5a61f8109', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_perfil`
--

CREATE TABLE `pessoa_perfil` (
  `CODPESSOA` int(11) NOT NULL,
  `CODPERFIL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa_perfil`
--

INSERT INTO `pessoa_perfil` (`CODPESSOA`, `CODPERFIL`) VALUES
(6, 2),
(30, 2),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 2),
(36, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `teste`
--

CREATE TABLE `teste` (
  `id` int(11) NOT NULL,
  `nome` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `teste`
--

INSERT INTO `teste` (`id`, `nome`) VALUES
(1, 'MAX123'),
(2, 'MAX123'),
(3, 'MAX123'),
(4, 'MAX123'),
(5, 'MAX123'),
(6, 'MAX123'),
(7, 'MAX123'),
(8, 'MAX123'),
(9, 'MAX123'),
(10, 'MAX123'),
(11, 'MAX123'),
(12, 'MAX123'),
(13, 'MAX123'),
(14, 'MAX123'),
(15, 'MAX123'),
(16, 'MAX123'),
(17, 'MAX123'),
(18, 'MAX123'),
(19, 'MAX123'),
(20, 'MAX123'),
(21, 'MAX123'),
(22, 'MAX123'),
(23, 'MAX123'),
(24, 'MAX123'),
(25, 'MAX123'),
(26, 'MAX123'),
(27, 'MAX123'),
(28, 'MAX123'),
(29, 'MAX123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`CODITEM`),
  ADD UNIQUE KEY `ACESSO_UNIQUE` (`STATE`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`CODPERFIL`),
  ADD UNIQUE KEY `PERFILcol_UNIQUE` (`NOME`);

--
-- Indexes for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`CODPERFIL`,`CODITEM`),
  ADD KEY `PERMISSOES_ITEM_idx` (`CODITEM`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`CODPESSOA`),
  ADD UNIQUE KEY `USUARIO_UNIQUE` (`USUARIO`),
  ADD UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`);

--
-- Indexes for table `pessoa_perfil`
--
ALTER TABLE `pessoa_perfil`
  ADD PRIMARY KEY (`CODPESSOA`,`CODPERFIL`),
  ADD KEY `PESSOAPERFIL_PERFIL_idx` (`CODPERFIL`);

--
-- Indexes for table `teste`
--
ALTER TABLE `teste`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `CODITEM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `CODPERFIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `CODPESSOA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `teste`
--
ALTER TABLE `teste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `PERMISSOES_ITEM` FOREIGN KEY (`CODITEM`) REFERENCES `item` (`CODITEM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `PERMISSOES_PERFIL` FOREIGN KEY (`CODPERFIL`) REFERENCES `perfil` (`CODPERFIL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pessoa_perfil`
--
ALTER TABLE `pessoa_perfil`
  ADD CONSTRAINT `PESSOAPERFIL_PERFIL` FOREIGN KEY (`CODPERFIL`) REFERENCES `perfil` (`CODPERFIL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `PESSOAPERFIL_PESSOA` FOREIGN KEY (`CODPESSOA`) REFERENCES `pessoa` (`CODPESSOA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
