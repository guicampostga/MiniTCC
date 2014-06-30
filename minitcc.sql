-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para database
CREATE DATABASE IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `database`;


-- Copiando estrutura para tabela database.authorities
CREATE TABLE IF NOT EXISTS `authorities` (
  `authority` varchar(50) NOT NULL DEFAULT '0',
  `username` varchar(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.authorities: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`authority`, `username`) VALUES
	('ROLE_ADMINISTRADOR', 'admin'),
	('ROLE_USUARIO', 'admin'),
	('ROLE_USUARIO', 'user'),
	('ROLE_USUARIO', 'usuario'),
	('ROLE_ADMINISTRADOR', 'usuario1');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;


-- Copiando estrutura para tabela database.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `cidade_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_descricao` varchar(50) NOT NULL,
  `estado_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cidade_codigo`),
  KEY `fk_cidade_estado_codigo` (`estado_codigo`),
  CONSTRAINT `fk_cidade_estado_codigo` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`estado_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.cidade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;


-- Copiando estrutura para tabela database.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nome` varchar(150) NOT NULL,
  `cliente_rg` varchar(10) DEFAULT '0',
  `cliente_cpf` varchar(14) NOT NULL DEFAULT '0',
  `cliente_data_nascimento` date NOT NULL DEFAULT '0000-00-00',
  `cliente_endereco` varchar(100) NOT NULL DEFAULT '0',
  `cliente_bairro` varchar(100) NOT NULL DEFAULT '0',
  `cliente_numero` varchar(10) NOT NULL DEFAULT '0',
  `cliente_complemento` varchar(10) DEFAULT '0',
  `cliente_telefone` varchar(14) NOT NULL DEFAULT '0',
  `cliente_cidade` varchar(100) NOT NULL DEFAULT '0',
  `estado_codigo` int(11) DEFAULT '0',
  PRIMARY KEY (`cliente_codigo`),
  KEY `fk_cliente_estado` (`estado_codigo`),
  CONSTRAINT `fk_cliente_estado` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`estado_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cliente_codigo`, `cliente_nome`, `cliente_rg`, `cliente_cpf`, `cliente_data_nascimento`, `cliente_endereco`, `cliente_bairro`, `cliente_numero`, `cliente_complemento`, `cliente_telefone`, `cliente_cidade`, `estado_codigo`) VALUES
	(1, 'Guilherme Fernandes Campos', '123456', '033.279.931-06', '1994-04-15', 'Rua 7A', 'Jardim Tangara 2', '2042', 'W', '(65) 9642-1662', 'Tangara da serra', 11);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Copiando estrutura para tabela database.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `empresa_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_nome_fantasia` varchar(100) NOT NULL,
  `empresa_razao_social` varchar(100) NOT NULL,
  `empresa_cnpj` varchar(18) NOT NULL,
  `empresa_endereco` varchar(50) NOT NULL,
  `empresa_bairro` varchar(50) NOT NULL,
  `empresa_numero` varchar(5) NOT NULL,
  `empresa_complemento` varchar(30) DEFAULT NULL,
  `empresa_cidade` varchar(50) NOT NULL,
  `estado_codigo` int(11) DEFAULT NULL,
  `empresa_telefone` varchar(14) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  PRIMARY KEY (`empresa_codigo`),
  KEY `fk_empresa_estado_codigo` (`estado_codigo`),
  CONSTRAINT `fk_empresa_estado_codigo` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`estado_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.empresa: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`empresa_codigo`, `empresa_nome_fantasia`, `empresa_razao_social`, `empresa_cnpj`, `empresa_endereco`, `empresa_bairro`, `empresa_numero`, `empresa_complemento`, `empresa_cidade`, `estado_codigo`, `empresa_telefone`, `empresa_email`) VALUES
	(2, 'Vilela Tranportes', 'Sapezal Transportes Rodoviarios LTDA - ME', '11.429.565/0001-05', 'Av Brasilia', 'Centro', '227', 'S', 'Tangara da Serra', 12, '(65) 3326-5610', 'teste@teste.com'),
	(5, 'Empresa', 'Rasao', '00.000.000/0000-00', 'rua', 'bairro', '1123', 'S', 'TGA', 11, '(56) 6565-6489', 'afadfdasfsd');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


-- Copiando estrutura para tabela database.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `estado_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `estado_descricao` char(2) NOT NULL,
  PRIMARY KEY (`estado_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.estado: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`estado_codigo`, `estado_descricao`) VALUES
	(1, 'AC'),
	(2, 'AL'),
	(3, 'AP'),
	(4, 'AM'),
	(5, 'BA'),
	(6, 'CE'),
	(7, 'DF'),
	(8, 'ES'),
	(9, 'GO'),
	(10, 'MA'),
	(11, 'MT'),
	(12, 'MS'),
	(13, 'MG'),
	(14, 'PB'),
	(15, 'PR'),
	(16, 'PE'),
	(17, 'PI'),
	(18, 'RJ'),
	(19, 'RN'),
	(20, 'RS'),
	(21, 'RO'),
	(22, 'RR'),
	(23, 'SC'),
	(24, 'SP'),
	(25, 'SE'),
	(26, 'TO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


-- Copiando estrutura para tabela database.funcao
CREATE TABLE IF NOT EXISTS `funcao` (
  `funcao_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `funcao_descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`funcao_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.funcao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` (`funcao_codigo`, `funcao_descricao`) VALUES
	(1, 'Motorista'),
	(2, 'Administrador');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;


-- Copiando estrutura para tabela database.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `funcionario_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_nome` varchar(150) NOT NULL,
  `funcionario_cpf` varchar(14) NOT NULL,
  `funcionario_rg` varchar(20) DEFAULT NULL,
  `funcionario_data_nascimento` date DEFAULT NULL,
  `funcionario_endereco` varchar(100) NOT NULL,
  `funcionario_numero_casa` varchar(4) NOT NULL,
  `funcionario_complemento` varchar(100) DEFAULT NULL,
  `funcionario_bairro` varchar(100) NOT NULL,
  `funcionario_cidade` varchar(100) NOT NULL,
  `estado_codigo` int(11) DEFAULT NULL,
  `funcionario_telefone` varchar(14) NOT NULL,
  `funcionario_email` varchar(100) NOT NULL,
  `funcao_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`funcionario_codigo`),
  KEY `fk_funcionario_funcao_codigo` (`funcao_codigo`),
  KEY `fk_funcionario_estado_codigo` (`estado_codigo`),
  CONSTRAINT `fk_funcionario_estado_codigo` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`estado_codigo`),
  CONSTRAINT `fk_funcionario_funcao_codigo` FOREIGN KEY (`funcao_codigo`) REFERENCES `funcao` (`funcao_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.funcionario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`funcionario_codigo`, `funcionario_nome`, `funcionario_cpf`, `funcionario_rg`, `funcionario_data_nascimento`, `funcionario_endereco`, `funcionario_numero_casa`, `funcionario_complemento`, `funcionario_bairro`, `funcionario_cidade`, `estado_codigo`, `funcionario_telefone`, `funcionario_email`, `funcao_codigo`) VALUES
	(1, 'Guilherme Fernandes Campos', '033.279.931-06', '123456', '1994-04-15', 'Rua 7A', '2042', 'W', 'Tangara 2', 'Tangara da serra', 10, '(65) 9642-1662', 'guicampostga@gmail.com', 2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


-- Copiando estrutura para tabela database.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `horario_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `horario_saida` char(5) NOT NULL,
  `horario_chegada` char(5) NOT NULL,
  `cidade_codigo_origem` int(11) DEFAULT NULL,
  `cidade_codigo_destino` int(11) DEFAULT NULL,
  PRIMARY KEY (`horario_codigo`),
  KEY `fk_cidade_origem` (`cidade_codigo_origem`),
  KEY `fk_cidade_destino` (`cidade_codigo_destino`),
  CONSTRAINT `fk_cidade_destino` FOREIGN KEY (`cidade_codigo_destino`) REFERENCES `cidade` (`cidade_codigo`),
  CONSTRAINT `fk_cidade_origem` FOREIGN KEY (`cidade_codigo_origem`) REFERENCES `cidade` (`cidade_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.horario: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`horario_codigo`, `horario_saida`, `horario_chegada`, `cidade_codigo_origem`, `cidade_codigo_destino`) VALUES
	(1, '08:00', '', NULL, NULL),
	(2, '12:30', '', NULL, NULL),
	(3, '16:00', '', NULL, NULL),
	(4, '06:00', '', NULL, NULL),
	(5, '10:00', '', NULL, NULL),
	(6, '14:30', '', NULL, NULL);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;


-- Copiando estrutura para tabela database.motorista
CREATE TABLE IF NOT EXISTS `motorista` (
  `motorista_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_codigo` varchar(50) NOT NULL,
  `motorista_tipo_cnh` char(2) NOT NULL,
  `motorista_codigo_cnh` varchar(11) NOT NULL,
  `motorista_data_venc_cnh` date NOT NULL,
  `veiculo_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`motorista_codigo`),
  KEY `fk_motorista_veiculo_codigo` (`veiculo_codigo`),
  CONSTRAINT `fk_motorista_veiculo_codigo` FOREIGN KEY (`veiculo_codigo`) REFERENCES `veiculo` (`veiculo_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.motorista: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;


-- Copiando estrutura para tabela database.users
CREATE TABLE IF NOT EXISTS `users` (
  `users_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `enabled` varchar(10) NOT NULL,
  `funcionario_codigo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`users_codigo`),
  KEY `fk_users_funcionario` (`funcionario_codigo`),
  CONSTRAINT `fk_users_funcionario` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`funcionario_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`users_codigo`, `username`, `password`, `enabled`, `funcionario_codigo`) VALUES
	(1, 'admin', 'admin', 'true', 1),
	(2, 'user', 'user', 'true', 1),
	(3, 'usuario', '123', 'true', 1),
	(4, 'usuario1', '123', 'true', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Copiando estrutura para tabela database.veiculo
CREATE TABLE IF NOT EXISTS `veiculo` (
  `veiculo_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `veiculo_modelo` varchar(50) NOT NULL DEFAULT '0',
  `veiculo_marca` varchar(50) NOT NULL DEFAULT '0',
  `veiculo_placa` varchar(8) NOT NULL DEFAULT '0',
  `veiculo_ano` varchar(4) NOT NULL DEFAULT '0',
  `veiculo_quantidade_vagas` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`veiculo_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.veiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` (`veiculo_codigo`, `veiculo_modelo`, `veiculo_marca`, `veiculo_placa`, `veiculo_ano`, `veiculo_quantidade_vagas`) VALUES
	(1, 'Gol G4', 'VW', 'AAA-1111', '2010', 4);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;


-- Copiando estrutura para tabela database.viagem
CREATE TABLE IF NOT EXISTS `viagem` (
  `viagem_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `viagem_passageiro` int(11) DEFAULT NULL,
  `viagem_destino` int(11) DEFAULT NULL,
  `viagem_origem` int(11) NOT NULL,
  `viagem_data_saida` date NOT NULL,
  `viagem_motorista` int(11) DEFAULT NULL,
  `viagem_veiculo` int(11) DEFAULT NULL,
  `viagem_endereco_entrega` varchar(100) NOT NULL,
  `viagem_bairro_entrega` varchar(100) NOT NULL,
  `viagem_numero_entrega` varchar(10) NOT NULL,
  `viagem_complemento_entrega` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`viagem_codigo`),
  KEY `fk_viagem_passageiro` (`viagem_passageiro`),
  KEY `fk_viagem_veiculo` (`viagem_veiculo`),
  KEY `fk_viagem_motorista` (`viagem_motorista`),
  KEY `fk_viagem_destino` (`viagem_destino`),
  CONSTRAINT `fk_viagem_destino` FOREIGN KEY (`viagem_destino`) REFERENCES `cidade` (`cidade_codigo`),
  CONSTRAINT `fk_viagem_motorista` FOREIGN KEY (`viagem_motorista`) REFERENCES `motorista` (`motorista_codigo`),
  CONSTRAINT `fk_viagem_passageiro` FOREIGN KEY (`viagem_passageiro`) REFERENCES `cliente` (`cliente_codigo`),
  CONSTRAINT `fk_viagem_veiculo` FOREIGN KEY (`viagem_veiculo`) REFERENCES `veiculo` (`veiculo_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela database.viagem: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
