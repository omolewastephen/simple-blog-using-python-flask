-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2020 at 05:16 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `path` varchar(255) NOT NULL,
  `user` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `path`, `user`, `createdAt`) VALUES
(2, '55 Ways To Make Money Online Without The Use of Internet', '<p>If you&rsquo;re thinking of&nbsp;<a href=\"https://makeawebsitehub.com/how-to-start-a-blog/\" target=\"_blank\">starting your very own blog</a>, but just don&rsquo;t have a clue on what to blog about, then fear not!</p>\r\n\r\n<p>In this article, I have included a whole load of blog examples from a wide variety of different niches.</p>\r\n\r\n<p>Since the beginning of the internet, millions and millions and millions of blogs have been created. Many have died due to lost interest or their owners giving up on the idea, while others have thrived and continue to grow,&nbsp;<a href=\"https://makeawebsitehub.com/how-to-make-money-blogging/\" target=\"_blank\">making money</a>&nbsp;and earning their owners a steady income. It&rsquo;s a constant evolution of content that keeps people coming back for more, especially if these blogs contact highly resourceful material that people find useful and interesting.</p>\r\n\r\n<p><img class=\"img img-responsive\" alt=\"Image 1.0\" src=\"https://makeawebsitehub.com/wp-content/uploads/2017/03/missthrifty-1024x544.jpg\" style=\"height:544px; width:1024px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>One of the more popular frugal blogs in the UK, Miss Thrifty is targeting young mums with her money saving, frugal tips and articles. And rightly so! The market is massive and she&rsquo;s meeting a need for this type of information. Young mums aren&rsquo;t exactly rolling in cash. They may have had to give up work and are now relying on just one wage coming in, so the need to be more frugal with everyday living is a must.</p>\r\n\r\n<p>The great thing about this blog is the conversational tone and the real person behind the brand. I think it&rsquo;s inspiring to other mums to see someone like them making such a difference in other people&rsquo;s lives by creating amazingly useful content that is 100% actionable. Also it may inspire mums to set up their own blog and to write about their experiences as a mother and a wife in the 21st century.</p>\r\n', 'static/uploads/thumbnails/examples-of-blog.jpg', 'bloke', '2020-01-29 13:24:39'),
(3, 'Examples of Blogs – Inspiration for New Bloggers', '<p>So when I talk about coming at a niche from a different angle, this example is exactly what I mean. Skint Dad is a site that helps young / new dads save money and be more frugal in their day to day living. There&rsquo;s also a section on their that shows guys how to make a little more cash on top of their monthly day job wage, which is vital in some cases just to keep your head above water. &nbsp;A lot of new dads have the added stress of not having their wives&rsquo; or girlfriends&rsquo; wage coming in each month, due to&nbsp;the temporary career change in being a full time mum of a baby. So having some content around how they can make a few extra &ldquo;Ps&rdquo; in their wallet each month, can ease the burden somewhat.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'static/uploads/thumbnails/skintdad-1024x521.jpg', 'bloke', '2020-01-29 13:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(3, 'lewa', '12345', 'omolewastephen@gmail.com'),
(4, 'bloke', '12345', 'abc@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
