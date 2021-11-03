-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 08:46 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `painel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_paciente`
--

CREATE TABLE `tb_paciente` (
  `id_paciente` int(11) NOT NULL,
  `nm_paciente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_paciente`
--

INSERT INTO `tb_paciente` (`id_paciente`, `nm_paciente`) VALUES
(10352097, 'Manoela Garcia Veloso'),
(10352635, 'Rafael Passos Castro'),
(10354533, 'Valcira Brandasso Capelo'),
(10358260, 'Emanueli Valentina de Sá');

-- --------------------------------------------------------

--
-- Table structure for table `tb_setor`
--

CREATE TABLE `tb_setor` (
  `id_setor` int(11) NOT NULL,
  `nm_setor` varchar(255) DEFAULT NULL,
  `cd_atendimento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indexes for table `tb_setor`
--
ALTER TABLE `tb_setor`
  ADD PRIMARY KEY (`id_setor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_setor`
--
ALTER TABLE `tb_setor`
  ADD CONSTRAINT `tb_setor_ibfk_1` FOREIGN KEY (`id_setor`) REFERENCES `tb_paciente` (`id_paciente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
