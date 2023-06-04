# création de la DB
create database mail;
GRANT ALL PRIVILEGES ON mail.* to 'mailUser'@'localhost' identified by [password];
FLUSH PRIVILEGES;
use mail;

# création de la table vitual_domains
CREATE TABLE `virtual_domains` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# création de la table virtual_users
CREATE TABLE `virtual_users` (
`id` INT NOT NULL AUTO_INCREMENT,
`domain_id` INT NOT NULL,
`password` VARCHAR(106) NOT NULL,
`email` VARCHAR(120) NOT NULL,
`maildir` VARCHAR(120) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `email` (`email`),
FOREIGN KEY (domain_id) REFERENCES domains_table(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;