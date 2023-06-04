# Ajout du domaine virtuel
INSERT INTO `mail`.`virtual_domains`
(`id` ,`name`)
VALUES
('1', 'mmes-4.ephec-ti.be');

# Ajout des différentes adresses mails utilisées + mdp + maildir + à quel domaine la lier
INSERT INTO `mail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('1', '1', ENCRYPT([password], CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'contact@mmes-4.ephec-ti.be', 'mmes-4.ephec-ti.be/contact/');

INSERT INTO `mail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('2', '1', ENCRYPT([password], CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'b2b@mmes-4.ephec-ti.be', 'mmes-4.ephec-ti.be/b2b/');

INSERT INTO `mail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('3', '1', ENCRYPT([password], CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'quentin@mmes-4.ephec-ti.be', 'mmes-4.ephec-ti.be/quentin/');

INSERT INTO `mail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('4', '1', ENCRYPT([password], CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'aymar@mmes-4.ephec-ti.be', 'mmes-4.ephec-ti.be/aymar/');

 