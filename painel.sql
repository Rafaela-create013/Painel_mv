-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2021 às 20:59
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `painel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE `tb_paciente` (
  `id_paciente` int(100) NOT NULL,
  `nm_paciente` varchar(100) NOT NULL,
  `idade_paciente` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_paciente`
--

INSERT INTO `tb_paciente` (`id_paciente`, `nm_paciente`, `idade_paciente`) VALUES
(10432477, 'Manuela Vitoria Santos', 19),
(10435263, 'Joao Carlos Magno', 56),
(10435763, 'Beatriz Castro Viana', 29),
(10438645, 'Rafael Cardoso Palmeira', 23),
(10438741, 'Marina Souza Paz', 40),
(10445565, 'Mariana Silveira Pontes', 25),
(10455782, 'Vitor Barbosa dos Santos', 34),
(10474588, 'Maikel Vitorio Nunes', 55),
(10478494, 'Maria Conceição Carlina', 67),
(10478496, 'Marcio Conceição Vieira', 88),
(10485429, 'Bruno Alcantra Menezes', 37),
(10485487, 'Manuel Santorino Silva', 88),
(10485587, 'Vitoria Alcantra Manuel', 45),
(10488847, 'Vitor de Souza Castro', 69),
(10493387, 'Ana Liz Vitorino Nunes', 9),
(10494582, 'Anthony Souza Castro', 5),
(10495587, 'Valentina Emanueli Silva', 12),
(10496235, 'Vitor Barbosa dos Santos', 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_setor`
--

CREATE TABLE `tb_setor` (
  `id_paciente` int(11) NOT NULL,
  `nm_setor` varchar(100) NOT NULL,
  `nm_leito` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_setor`
--

INSERT INTO `tb_setor` (`id_paciente`, `nm_setor`, `nm_leito`) VALUES
(10432477, '1A - Internação Cardiologia', '1A 001 01'),
(10435763, '3H - Internação UTI Geral', '3H 002 02'),
(10438645, '4C - Internação Covid', '4C 002 02'),
(10438741, '3H - Internação UTI Geral', '3H 003 03'),
(10445565, '1A - Internação Cardiologia', '1A 020 20'),
(10455782, '1A - Internação Cardiologia', '1A 012 12'),
(10474588, '4C - Internação Covid', '4C 020 20'),
(10478494, '1A - Internação Cardiologia', '1A 015 15'),
(10478496, '4C - Internação Covid', '4C 011 11'),
(10485587, '1A - Internação Cardiologia', '1A 012 12'),
(10488847, '4C - Internação Covid', '4C 016 16'),
(10493387, '2B - Internação Pediatria', '2B 011 11'),
(10494582, '2B - Internação Pediatria', '2B 010 10'),
(10495587, '2B - Internação Pediatria', '2B 001 01'),
(10496235, '3H - Internação UTI Geral', '3H 005 05');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Índices para tabela `tb_setor`
--
ALTER TABLE `tb_setor`
  ADD PRIMARY KEY (`id_paciente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_setor`
--
ALTER TABLE `tb_setor`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10496236;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_setor`
--
ALTER TABLE `tb_setor`
  ADD CONSTRAINT `fk_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
