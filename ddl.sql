CREATE TABLE IF NOT EXISTS `earnings` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_earning` date NOT NULL,
  `type` enum('salary','scholarship','inheritance','other') NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_expense` date NOT NULL,
  `type` enum('food','fuel','entertainment','education','other') NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `earnings`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;

ALTER TABLE `expenses`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;