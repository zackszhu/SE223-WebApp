CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Author` varchar(45) DEFAULT NULL,
  `Publisher` varchar(45) DEFAULT NULL,
  `ISBN` varchar(45) NOT NULL,
  `Price` double NOT NULL DEFAULT '0',
  `Rating` int(11) DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
