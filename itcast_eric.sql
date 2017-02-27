-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 02 月 27 日 14:20
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `itcast_eric`
--

-- --------------------------------------------------------

--
-- 表的结构 `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代表id',
  `title` varchar(100) NOT NULL COMMENT '代表日记标题',
  `content` text NOT NULL COMMENT '代表日记内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`) VALUES
(3, '配置一个简单而实用的 JavaScript 开发环境', '666%E6%A0%B9%E6%8D%AE%E6%88%91%E7%9A%84%E7%BB%8F%E9%AA%8C%EF%BC%8C%E5%86%99%E4%B8%80%E4%B8%AA%E6%A8%A1%E5%9D%97%E6%88%96%20CLI%20%E5%B7%A5%E5%85%B7%E5%89%8D%E4%BD%A0%E6%89%80%E8%A6%81%E5%81%9A%E7%9A%84%E7%AC%AC%E4%B8%80%E4%BB%B6%E4%BA%8B%E5%B0%B1%E6%98%AF%E8%AE%BE%E7%BD%AE%E4%B8%80%E4%B8%AA%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83%E3%80%82%E5%AF%B9%E8%BF%99%E4%B8%AA%E6%AD%A5%E9%AA%A4%E6%9C%89%E4%BA%BA%E5%96%9C%E6%AC%A2%E6%9C%89%E4%BA%BA%E6%84%81%E3%80%82%E4%BD%86%E4%B8%8D%E7%AE%A1%E6%80%8E%E6%A0%B7%EF%BC%8C%E5%AE%83%E5%8F%AF%E8%83%BD%E6%80%BB%E6%98%AF%E8%8A%B1%E6%8E%89%E4%BD%A0%E5%BE%88%E5%A4%9A%E6%97%B6%E9%97%B4%EF%BC%8C%E4%BD%A0%E5%BE%97%E4%B8%8D%E5%81%9C%E5%9C%B0%E8%B0%83%E6%95%B4%E4%BD%A0%E9%85%8D%E7%BD%AE%E7%9A%84%E6%96%B9%E6%96%B9%E9%9D%A2%E9%9D%A2%E3%80%82%0D%0A%0D%0A%E5%BD%93%E7%84%B6%EF%BC%8C%E4%BD%A0%E5%8F%AF%E8%83%BD%E4%BD%BF%E7%94%A8%20webpack%E3%80%81eslint%E3%80%81jasmine%20%E7%94%9A%E8%87%B3%E6%98%AF%20TypeScript%EF%BC%88%E8%80%8C%E6%9C%80%E7%BB%88%E5%8F%AF%E8%83%BD%E5%8F%AA%E6%8D%A2%E6%9D%A5%E2%80%9C%E5%BE%88%E6%A3%92%E2%80%9D%E7%9A%84%E7%BC%96%E8%AF%91%E9%94%99%E8%AF%AF%E4%BF%A1%E6%81%AF%EF%BC%89%E3%80%82%E4%BA%8B%E5%AE%9E%E4%B8%8A%EF%BC%8C%E5%A4%A7%E9%83%A8%E5%88%86%E6%83%85%E5%86%B5%E4%B8%8B%EF%BC%8C%E4%BD%9C%E4%B8%BA%E5%BC%80%E5%8F%91%E8%80%85%EF%BC%8C%E6%88%91%E4%BB%AC%E5%8F%AF%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%80%E4%BA%9B%E5%87%A0%E4%B9%8E%E4%B8%8D%E7%94%A8%E9%85%8D%E7%BD%AE%E7%9A%84%E5%B7%A5%E5%85%B7%E3%80%82%E9%80%9A%E5%B8%B8%E6%9D%A5%E8%AF%B4%EF%BC%8C%E8%BF%99%E4%BA%9B%E2%80%9C%E5%BC%80%E7%AE%B1%E5%8D%B3%E7%94%A8%E2%80%9D%E7%9A%84%E5%B7%A5%E5%85%B7%E6%98%AF%E5%AE%8C%E5%85%A8%E5%8F%AF%E4%BB%A5%E6%8E%A5%E5%8F%97%E7%9A%84%EF%BC%8C%E5%B9%B6%E5%B0%86%E5%B8%AE%E5%8A%A9%E6%88%91%E4%BB%AC%E7%9B%B4%E6%8E%A5%E8%A7%A3%E5%86%B3%E9%97%AE%E9%A2%98%EF%BC%8C%E5%90%8C%E6%97%B6%E8%BF%98%E8%83%BD%E6%8F%90%E4%BE%9B%E5%87%A0%E4%B9%8E%E5%AE%9E%E6%97%B6%E7%9A%84%E5%8F%8D%E9%A6%88%E9%97%AD%E7%8E%AF%E3%80%82%0D%0A%0D%0A%E5%BD%93%E6%88%91%E4%BB%AC%E8%B0%88%E8%AE%BA%E6%9C%80%E5%B0%8F%E5%8C%96%E9%85%8D%E7%BD%AE%EF%BC%8C%E6%88%91%E4%BB%AC%E6%9C%80%E5%85%B3%E6%B3%A8%E7%9A%84%E6%98%AF%E6%B5%8B%E8%AF%95%E3%80%81%E4%BB%A3%E7%A0%81%E8%A7%84%E8%8C%83%E6%A3%80%E6%9F%A5%E3%80%81%E7%9B%91%E6%8E%A7%E6%96%87%E4%BB%B6%E5%86%85%E5%AE%B9%E6%94%B9%E5%8F%98%E4%BB%A5%E5%8F%8A%E7%A1%AE%E4%BF%9D%E4%BD%A0%E5%9C%A8%E6%8F%90%E4%BA%A4%E4%BB%A3%E7%A0%81%E5%89%8D%E6%B2%A1%E6%90%9E%E7%A0%B8%E5%89%8D%E9%9D%A2%E8%BF%99%E4%BA%9B%E7%82%B9%E3%80%82'),
(4, '想说爱你不容易——致Javascript的一封信', '关于我们开源社区，有一个问题我需要在这里着重讨论一下。\n\n我是社区里很多开源项目（如Babel、Flow、Yarn、Lerna等）的贡献者和维护者。在社区里，我度过了许多美好的时光，同时也有过一些不愉快的体验。\n\n因为参与社区，我受邀到世界各地参会讲演，也因此足迹遍布全球，广交天下好友。一些挚友正是通过这些开源工作才有幸得以结识。 不过恐怕不是所有的体验都能如此美好。\n\n维护这些拥有成百上千用户的项目，意味着你要直面来自用户的诸多批评。这种感觉有时很像当一名政客。虽然有些并没什么价值，但是多数的批评还是很中肯的。然而，很多批评往往带有极度的负面情绪，令人好生难受。'),
(5, '111', '111'),
(6, '111', '111'),
(7, '111', '111'),
(8, '44', '44'),
(9, 'wef', 'wfe'),
(10, 'wef', 'wfeewfewfwfe2122333');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代表的是索引',
  `name` varchar(30) NOT NULL COMMENT '代表的是菜名',
  `price` int(11) NOT NULL COMMENT '代表的是价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`) VALUES
(1, '宫保鸡丁', 15),
(2, '剁掉鱼头', 20),
(3, '葱爆鸡蛋', 12),
(4, '盐酥鸡', 16);

-- --------------------------------------------------------

--
-- 表的结构 `todo`
--

CREATE TABLE IF NOT EXISTS `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `taskName` varchar(50) NOT NULL COMMENT '代表要做的事情',
  `isCompleted` int(11) NOT NULL COMMENT '代表是否完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `todo`
--

INSERT INTO `todo` (`id`, `taskName`, `isCompleted`) VALUES
(1, '吃饭', 0),
(2, '睡觉', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
