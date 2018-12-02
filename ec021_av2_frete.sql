-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 07:49 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ec021_av2_frete`
--
DROP DATABASE IF EXISTS `ec021_av2_frete`;
CREATE DATABASE IF NOT EXISTS `ec021_av2_frete` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ec021_av2_frete`;

-- --------------------------------------------------------

--
-- Table structure for table `frete`
--

DROP TABLE IF EXISTS `frete`;
CREATE TABLE `frete` (
  `frete_id` int(11) NOT NULL,
  `motorista` text NOT NULL,
  `data_saida` date NOT NULL,
  `origem` text NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frete`
--

INSERT INTO `frete` (`frete_id`, `motorista`, `data_saida`, `origem`, `tipo_id`) VALUES
(1, 'Adosindo Fátima Rangel', '2018-01-01', 'São Paulo', 1),
(2, 'Alarico Graciano Quintão', '2018-02-26', 'Rio de Janeiro', 5),
(3, 'Anita Roseli Varanda', '2018-04-20', 'Brasília', 2),
(4, 'Barnabé Miguel Franca', '2018-03-16', 'Salvador', 4),
(5, 'Cesário Murilo Patrício', '2018-02-25', 'Fortaleza', 5),
(6, 'Constantino Flávio Quintão', '2018-06-17', 'Belo Horizonte', 2),
(7, 'Egas Filena Pinto', '2018-03-17', 'Manaus', 2),
(8, 'Emanuel Madalena Gabeira', '2018-06-26', 'Curitiba', 3),
(9, 'Galindo Raul Grilo', '2018-05-12', 'Recife', 2),
(10, 'Gaspar Adélia Lameirinhas', '2018-06-16', 'Porto Alegre', 3),
(11, 'Girão Júlio Bezerra', '2018-05-17', 'Porto Alegre', 5),
(12, 'Gláucia Renata Simas', '2018-01-28', 'Rio de Janeiro', 2),
(13, 'Gualdim Claudemiro Doutel', '2018-02-05', 'Belo Horizonte', 4),
(14, 'Gui Albino Oleiro', '2018-03-02', 'São Paulo', 2),
(15, 'Guida Adelaide Norões', '2018-06-03', 'Belo Horizonte', 4),
(16, 'Leonardo Gerardo Borges', '2018-04-16', 'Rio de Janeiro', 4),
(17, 'Nestor Parcidio Picanço', '2018-05-17', 'Brasília', 1),
(18, 'Norberto Valdeci Domingues', '2018-05-08', 'São Paulo', 1),
(19, 'Olívia Rodolfo Póvoas', '2018-05-27', 'Porto Alegre', 3),
(20, 'Palmiro Faustino Guterres', '2018-04-14', 'Rio de Janeiro', 1),
(21, 'Rudi Alexandra Prada', '2018-04-09', 'São Paulo', 2),
(22, 'Saul Ovídio Beltrão', '2018-02-28', 'Rio de Janeiro', 5),
(23, 'Telma Adolfo Beltrão', '2018-06-03', 'Brasília', 5),
(24, 'Teodorico Evandro Nazário', '2018-05-05', 'São Paulo', 1),
(25, 'Zara Josefa Simas', '2018-03-12', 'Brasília', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_frete`
--

DROP TABLE IF EXISTS `tipo_frete`;
CREATE TABLE `tipo_frete` (
  `tipo_id` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor_minimo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_frete`
--

INSERT INTO `tipo_frete` (`tipo_id`, `descricao`, `valor_minimo`) VALUES
(1, 'Medicamentos', 2737),
(2, 'Gás', 3471),
(3, 'Combustível', 4115),
(4, 'Alimentos perecíveis', 3333),
(5, 'Leite', 1065);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `frete`
--
ALTER TABLE `frete`
  ADD PRIMARY KEY (`frete_id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indexes for table `tipo_frete`
--
ALTER TABLE `tipo_frete`
  ADD PRIMARY KEY (`tipo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `frete`
--
ALTER TABLE `frete`
  MODIFY `frete_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tipo_frete`
--
ALTER TABLE `tipo_frete`
  MODIFY `tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `frete`
--
ALTER TABLE `frete`
  ADD CONSTRAINT `tipo_fk` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_frete` (`tipo_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
