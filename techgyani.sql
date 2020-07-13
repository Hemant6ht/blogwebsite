-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 13, 2020 at 06:08 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techgyani`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` text NOT NULL,
  `msg` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'rajiv', 'rajiv@email', '87377256', 'ye rajiv ka testing message hai', '2020-05-24 15:40:09'),
(7, 'ramavtar', 'hemanrbjbshvx@bjhds', '188237489', 'ram aaj aam khaya', '2020-05-24 16:43:23'),
(8, 'rajesj', 'rak@hsh', '1111111111', 'bhak sala', '2020-05-24 18:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `slug` text NOT NULL,
  `author` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `contents` varchar(1000) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `imgfile` text NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `slug`, `author`, `title`, `contents`, `date`, `imgfile`) VALUES
(33, 'blockchain', 'Sunil pal singh', 'Blockchain the future world technology', 'It is well known that blockchain technology can be used to build cryptocurrencies; Bitcoin is a working example of this.', '2020-07-13 20:52:31', 'uploads/blockchain.png'),
(34, 'windows11', 'Hemant Kumar Yadav', 'Windows 11 is back and available in near future', 'Windows 11 Release Date Features Concept ISO Microsoft, Microsoft windows 11 Iso download from the official website. Get windows 11 updates now\r\n            \r\n            ', '2020-07-13 20:54:37', 'uploads/windows.jpg'),
(35, 'tata', 'Nitesh Sagar', 'Tata Altroz india\'s new SUV likely to hit indian market by 2020', 'Altroz price starts at Rs 5.29 Lakh ex-showroom and Baleno price starts Rs 5.63 Lakh ex-showroom. Compare these two models on the basis of their price, features & specs', '2020-07-13 21:08:32', 'uploads/tata.jpeg'),
(36, 'cloudcomputing', 'Amit Kumar Chauhan', 'Cloud computing the future hardisk.', 'Cloud computing is the on-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user. The term is generally used to describe data centers available to many users over the Internet.', '2020-07-13 22:01:33', 'uploads/cloud.jpeg'),
(37, 'bitcoin', 'Amartya Banerjee', 'What is a Bitcoin and how does it work?', 'Each Bitcoin is basically a computer file which is stored in a \'digital wallet\' app on a smartphone or computer. People can send Bitcoins (or part of one) to your digital wallet, and you can send Bitcoins to other people. Every single transaction is recorded in a public list called the blockchain', '2020-07-13 22:03:13', 'uploads/bitcoin.jpg'),
(38, 'ott', 'Hemant Kumar', 'OTT the future of Entertainment', 'In an increasingly technology driven world with the number of connected devices crossing 2 billion and growing, the movement from cable viewing to Over-The-Top (OTT) is natural. An OTT platform offers the flexibility to watch one’s favorite TV shows across a range of connected devices, something which the traditional model of cable viewing cannot offer due to technological limitations. From OTT platforms that work across Windows and Mac operating systems to iPhones and Android based phones as well as televisions across technologies, there is no longer any question of whether television programming will cater to this growing market. Instead, television operators are now scrambling to ensure that their OTT platform is able to provide the most powerful viewing experience to customers.', '2020-07-13 22:07:02', 'uploads/ott.jpg'),
(39, 'tiktokban', 'Hrishikesh Konderu', 'Increased tensions between USA and China may lead to Tiktok ban', 'With backlash swelling around TikTok\'s relationship with China, the United States Army this week announced that U.S. soldiers can no longer have the social media app on government-owned phones. TikTok, a social media app used to create and share short form videos, is owned by Beijing-based parent company ByteDance.', '2020-07-13 22:11:58', 'uploads/tiktokban.jpg'),
(40, 'chingari', 'Vikash Kumar Bhusan', 'Amid Tiktok ban in India Chingari is  increased it user base', 'The app which was founded by Bengaluru-based programmers Biswatma Nayak and Siddharth Gautam in 2019. Chingari allows a user to download and upload videos, chat with friends, interact with new people, share content, and browse through feed. On Android, the app requires version 5.0 and up.Jun 30, 2020', '2020-07-13 22:14:24', 'uploads/chingari.jpg'),
(41, 'ssd', 'Sumit Kumar Verma', 'SSD solid state drives ', 'A solid-state drive (SSD) is a new generation of storage device used in computers. SSDs replace traditional mechanical hard disks by using flash-based memory, which is significantly faster. Older hard-disk storage technologies run slower, which often makes your computer run slower than it should.', '2020-07-13 22:16:12', 'uploads/ssd.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
